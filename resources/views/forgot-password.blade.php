@extends('dashboard.layout.main')
@section('content')

<section class="min-h-screen flex items-center justify-center bg-light">
    <div class="flex w-full max-w-5xl bg-white border border-border overflow-hidden">

        {{-- Left Image --}}
        <div class="hidden lg:flex w-[45%] relative">
            <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=900&q=80"
                class="absolute inset-0 w-full h-full object-cover" />
            <div class="absolute inset-0 bg-primary/70"></div>
            <div class="relative z-10 flex flex-col justify-between p-12 w-full text-white">
                <a href="{{ url('/') }}">
                    <img src="assets/images/logo.png" alt="Heritage Textiles" class="h-10 w-auto" />
                </a>
                <div>
                    <div class="w-16 h-1 bg-brand mb-8"></div>
                    <h2 class="text-[32px] font-bold mb-4 italic">Forgot your<br/>Password?</h2>
                    <p class="text-white/60 text-sm leading-relaxed">
                        No worries! Enter your email and we'll send you a reset link instantly.
                    </p>
                </div>
                <p class="text-white/30 text-[11px]">© 2026 Heritage Textiles. All rights reserved.</p>
            </div>
        </div>

        {{-- Right Form --}}
        <div class="flex-1 flex items-center justify-center px-8 py-16 bg-white">
            <div class="w-full max-w-[380px]">

                <div class="w-12 h-12 bg-brand/10 flex items-center justify-center mb-6">
                    <iconify-icon icon="lucide:mail" width="22" class="text-brand"></iconify-icon>
                </div>

                <h1 class="text-[28px] font-bold text-primary mb-1">Forgot Password</h1>
                <p class="text-secondary text-[14px] mb-8">Enter your email to receive a reset link</p>

                {{-- Success Message --}}
                @if(session('success'))
                    <div class="mb-6 p-4 bg-green-50 border border-green-200 text-green-700 text-[13px] flex items-start gap-2">
                        <iconify-icon icon="lucide:check-circle" width="16" class="mt-0.5 shrink-0"></iconify-icon>
                        <span>{{ session('success') }}</span>
                    </div>
                @endif

                {{-- Error --}}
                @if($errors->any())
                    <div class="mb-4 p-3 bg-red-50 border border-red-200 text-red-700 text-[12px] space-y-1">
                        @foreach($errors->all() as $error)
                            <p>• {{ $error }}</p>
                        @endforeach
                    </div>
                @endif

                <form method="POST" action="{{ route('password.email') }}">
                    @csrf
                    <div class="space-y-5">
                        <div class="space-y-1.5">
                            <label class="text-[13px] font-medium text-primary">Email Address</label>
                            <input type="email" name="email" value="{{ old('email') }}"
                                placeholder="you@example.com"
                                class="w-full border border-border px-4 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors rounded-none" />
                        </div>

                        <button type="submit"
                            class="w-full bg-brand text-white text-[14px] font-semibold py-3.5 hover:bg-primary transition-all">
                            Send Reset Link
                        </button>
                    </div>
                </form>

                <p class="text-[13px] text-secondary mt-8 text-center">
                    Remember your password?
                    <a href="{{ route('login') }}" class="text-brand font-bold hover:underline ml-1">Sign In</a>
                </p>
            </div>
        </div>
    </div>
</section>

@endsection
