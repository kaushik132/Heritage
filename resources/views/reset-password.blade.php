@extends('dashboard.layout.main')
@section('content')

<section class="min-h-screen flex items-center justify-center bg-light" x-data="{ showPass: false, showConfirm: false }">
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
                    <h2 class="text-[32px] font-bold mb-4 italic">Set a New<br/>Password</h2>
                    <p class="text-white/60 text-sm leading-relaxed">
                        Choose a strong password to keep your account secure.
                    </p>
                </div>
                <p class="text-white/30 text-[11px]">© 2026 Heritage Textiles. All rights reserved.</p>
            </div>
        </div>

        {{-- Right Form --}}
        <div class="flex-1 flex items-center justify-center px-8 py-16 bg-white">
            <div class="w-full max-w-[380px]">

                <div class="w-12 h-12 bg-brand/10 flex items-center justify-center mb-6">
                    <iconify-icon icon="lucide:lock" width="22" class="text-brand"></iconify-icon>
                </div>

                <h1 class="text-[28px] font-bold text-primary mb-1">New Password</h1>
                <p class="text-secondary text-[14px] mb-8">Enter and confirm your new password below</p>

                @if($errors->any())
                    <div class="mb-4 p-3 bg-red-50 border border-red-200 text-red-700 text-[12px] space-y-1">
                        @foreach($errors->all() as $error)
                            <p>• {{ $error }}</p>
                        @endforeach
                    </div>
                @endif

                <form method="POST" action="{{ route('password.update') }}">
                    @csrf
                    <input type="hidden" name="token" value="{{ $token }}" />
                    <input type="hidden" name="email" value="{{ $email }}" />

                    <div class="space-y-5">

                        <div class="space-y-1.5">
                            <label class="text-[13px] font-medium text-primary">New Password</label>
                            <div class="relative">
                                <input name="password" :type="showPass ? 'text' : 'password'"
                                    placeholder="Min. 8 characters"
                                    class="w-full border border-border px-4 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors rounded-none pr-11" />
                                <button type="button" @click="showPass = !showPass"
                                    class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary">
                                    <iconify-icon :icon="showPass ? 'lucide:eye-off' : 'lucide:eye'" width="17"></iconify-icon>
                                </button>
                            </div>
                        </div>

                        <div class="space-y-1.5">
                            <label class="text-[13px] font-medium text-primary">Confirm Password</label>
                            <div class="relative">
                                <input name="password_confirmation" :type="showConfirm ? 'text' : 'password'"
                                    placeholder="Repeat your password"
                                    class="w-full border border-border px-4 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors rounded-none pr-11" />
                                <button type="button" @click="showConfirm = !showConfirm"
                                    class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary">
                                    <iconify-icon :icon="showConfirm ? 'lucide:eye-off' : 'lucide:eye'" width="17"></iconify-icon>
                                </button>
                            </div>
                        </div>

                        <button type="submit"
                            class="w-full bg-brand text-white text-[14px] font-semibold py-3.5 hover:bg-primary transition-all">
                            Reset Password
                        </button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>

@endsection
