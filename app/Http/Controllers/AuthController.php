<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Password;          // ← Facade (reset ke liye)
use Illuminate\Validation\Rules\Password as PasswordRule; // ← Validation rule
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Str;
use App\Mail\ResetPasswordMail;
use Illuminate\Support\Facades\Log;


class AuthController extends Controller
{
    // ─── Views ───────────────────────────────────────────

    public function loginPage()
    {
        if (Auth::check()) return redirect()->route('home'); // dashboard → home
        return view('login');
    }

    public function registerPage()
    {
        if (Auth::check()) return redirect()->route('home'); // dashboard → home
        return view('signup');
    }
    // ─── Register ────────────────────────────────────────

    public function register(Request $request)
    {
        $rules = [
            'first_name'   => 'required|string|max:100',
            'last_name'    => 'required|string|max:100',
            'email'        => 'required|email|unique:users,email',
            'phone'        => 'required|string|max:15',
            'account_type' => 'required|in:retail,wholesale',
            'password' => ['required', 'string', PasswordRule::min(8)],
            'terms'        => 'accepted',
        ];

        if ($request->account_type === 'wholesale') {
            $rules['business_name'] = 'required|string|max:200';
            $rules['gst_number']    = 'required|string|max:20';
        }

        $validated = $request->validate($rules, [
            'terms.accepted' => 'You must agree to the Terms & Conditions.',
            'email.unique'   => 'This email is already registered. Please login.',
        ]);

        $user = User::create([
            'first_name'    => $validated['first_name'],
            'last_name'     => $validated['last_name'],
            'email'         => $validated['email'],
            'phone'         => $validated['phone'],
            'account_type'  => $validated['account_type'],
            'business_name' => $validated['business_name'] ?? null,
            'gst_number'    => $validated['gst_number'] ?? null,
            'password'      => Hash::make($validated['password']),
        ]);

        Auth::login($user);

        return redirect()->route('register')
            ->with('success', 'Welcome to Heritage Textiles, ' . $user->first_name . '!');
    }

    // ─── Login ───────────────────────────────────────────

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email'    => 'required|email',
            'password' => 'required|string',
        ]);

        if (Auth::attempt($credentials, $request->boolean('remember'))) {
            $request->session()->regenerate();
            return redirect()->intended(route('home'))
                ->with('success', 'Welcome back, ' . Auth::user()->first_name . '!');
        }

        return back()
            ->withInput($request->only('email'))
            ->withErrors(['email' => 'These credentials do not match our records.']);
    }

    // ─── Logout ──────────────────────────────────────────

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('home');
    }

    // ─── Profile Update ──────────────────────────────────

    public function updateProfile(Request $request)
    {
        $user = Auth::user();

        $validated = $request->validate([
            'first_name' => 'required|string|max:100',
            'last_name'  => 'required|string|max:100',
            'email'      => 'required|email|unique:users,email,' . $user->id,
            'phone'      => 'required|string|max:15',
            'gender'     => 'nullable|in:Male,Female,Other',
        ]);

        $user->update($validated);

        return back()->with('success', 'Profile updated successfully!');
    }

    // ─── Password Update ─────────────────────────────────

    public function updatePassword(Request $request)
    {
        $request->validate([
            'current_password'  => 'required|string',
            'password' => ['required', 'string', PasswordRule::min(8), 'confirmed'],
        ], [
            'password.confirmed' => 'New password and confirm password do not match.',
        ]);

        $user = Auth::user();

        if (!Hash::check($request->current_password, $user->password)) {
            return back()->withErrors(['current_password' => 'Current password is incorrect.']);
        }

        $user->update([
            'password' => Hash::make($request->password),
        ]);

        return back()->with('password_success', 'Password updated successfully!');
    }


    // ─── Forgot Password Page ─────────────────────────
    public function forgotPasswordPage()
    {
        return view('forgot-password');
    }

    // ─── Send Reset Link ──────────────────────────────
    public function sendResetLink(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
        ], [
            'email.exists' => 'No account found with this email address.',
        ]);

        try {
            $status = Password::sendResetLink(
                $request->only('email'),
                function ($user, $token) {
                    $resetUrl = url(route('password.reset', [
                        'token' => $token,
                        'email' => $user->email,
                    ], false));

                    Mail::to($user->email)->send(
                        new ResetPasswordMail($resetUrl, $user->first_name)
                    );
                }
            );

            if ($status === Password::RESET_LINK_SENT) {
                return back()->with('success', 'Password reset link sent! Please check your email.');
            }

            // Status code bhi dikhao
            return back()->withErrors(['email' => 'Failed. Status: ' . $status]);
        } catch (\Exception $e) {
            // Actual error dikhao
            return back()->withErrors(['email' => 'Error: ' . $e->getMessage()]);
        }
    }

    // ─── Reset Password Page ──────────────────────────
    public function resetPasswordPage(Request $request, string $token)
    {
        return view('reset-password', [
            'token' => $token,
            'email' => $request->email,
        ]);
    }

    // ─── Reset Password ───────────────────────────────
  // ─── Reset Password ───────────────────────────────
public function resetPassword(Request $request)
{
    $request->validate([
        'token'    => 'required',
        'email'    => 'required|email',
        'password' => ['required', 'string', 'min:8', 'confirmed'],
    ], [
        'password.confirmed' => 'Passwords do not match.',
    ]);

    $status = Password::reset(
        $request->only('email', 'password', 'password_confirmation', 'token'),
        function ($user, $password) {
            Log::info('Saving password for: ' . $user->email);
            Log::info('Plain password received: ' . $password);

            $user->forceFill([
                'password'       => Hash::make($password),
                'remember_token' => Str::random(60),
            ])->save();

            Log::info('New hash saved: ' . $user->fresh()->password);

            event(new PasswordReset($user));
        }
    );

    if ($status === Password::PASSWORD_RESET) {
        return redirect()->route('login')
            ->with('success', 'Password reset successfully! Please login.');
    }

    return back()->withErrors(['email' => 'This reset link is invalid or has expired. Status: ' . $status]);
}

}
