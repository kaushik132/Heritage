@extends('dashboard.layout.main')
@section('content')

    <section class="min-h-screen flex items-center justify-center bg-light" x-data="{ showPass: false }">
        <div class="flex w-full max-w-5xl bg-white border border-border overflow-hidden">

            <div class="hidden lg:flex w-[45%] relative">
                <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=900&q=80" alt="Heritage Textiles"
                    class="absolute inset-0 w-full h-full object-cover" />

                <div class="absolute inset-0 bg-primary/70"></div>

                <div class="relative z-10 flex flex-col justify-between p-12 w-full text-white">
                    <a href="index.php">
                        <img src="assets/images/logo.png" alt="Heritage Textiles" class="h-10 w-auto" />
                    </a>

                    <div>
                        <div class="w-16 h-1 bg-brand mb-8"></div>
                        <h2 class="text-[32px] font-bold mb-4 italic">
                            Crafted with <br />Passion & Precision
                        </h2>
                        <p class="text-white/60 text-sm leading-relaxed">
                            Premium textiles sourced directly from artisans across India. Experience authenticity in every
                            weave.
                        </p>
                    </div>

                    <p class="text-white/30 text-[11px]">© 2026 Heritage Textiles. All rights reserved.</p>
                </div>
            </div>

            <div class="flex-1 flex items-center justify-center px-8 py-16 bg-white">
                <div class="w-full max-w-[380px]">

                    <h1 class="text-[28px] font-bold text-primary mb-1">Welcome back</h1>
                    <p class="text-secondary text-[14px] mb-10">Sign in to your account to continue</p>
                    <form action="{{ route('login.post') }}" method="POST">

                        @if ($errors->any())
                            <div class="mb-4 p-3 bg-red-50 border border-red-200 text-red-700 text-[12px] space-y-1">
                                @foreach ($errors->all() as $error)
                                    <p>• {{ $error }}</p>
                                @endforeach
                            </div>
                        @endif


                        @csrf
                        <div class="space-y-6">

                            <div class="space-y-1.5">
                                <label class="text-[13px] font-medium text-primary">Email address</label>
                                <input type="email" name="email" placeholder="you@example.com"
                                    value="{{ old('email') }}"
                                    class="w-full border border-border rounded-none px-4 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                            </div>

                            <div class="space-y-1.5">
                                <div class="flex items-center justify-between">
                                    <label class="text-[13px] font-medium text-primary">Password</label>
                                    <a href="{{ route('password.request') }}"
                                        class="text-[12px] text-brand font-medium hover:underline">
                                        Forgot password?
                                    </a>
                                </div>
                                <div class="relative">
                                    <input name="password" :type="showPass ? 'text' : 'password'"
                                        placeholder="Enter your password"
                                        class="w-full border border-border rounded-none px-4 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors pr-11" />
                                    <button @click="showPass = !showPass" type="button"
                                        class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary transition-colors">
                                        <iconify-icon :icon="showPass ? 'lucide:eye-off' : 'lucide:eye'"
                                            width="17"></iconify-icon>
                                    </button>
                                </div>
                            </div>

                            <button type="submit"
                                class="w-full bg-brand text-white text-[14px] font-semibold py-3.5 rounded-none hover:bg-primary transition-all shadow-none">
                                Sign In
                            </button>

                            {{-- <div class="flex items-center gap-3 py-2">
                        <div class="flex-1 border-t border-border"></div>
                        <span class="text-[12px] text-placeholder font-medium">or sign in with</span>
                        <div class="flex-1 border-t border-border"></div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <button class="flex items-center justify-center gap-2 border border-border rounded-none py-2.5 text-[13px] font-medium text-primary hover:bg-light transition-colors">
                            <iconify-icon icon="logos:google-icon" width="16"></iconify-icon>
                            Google
                        </button>
                        <button class="flex items-center justify-center gap-2 border border-border rounded-none py-2.5 text-[13px] font-medium text-primary hover:bg-light transition-colors">
                            <iconify-icon icon="logos:facebook" width="16"></iconify-icon>
                            Facebook
                        </button>
                    </div> --}}

                        </div>
                    </form>

                    <p class="text-[13px] text-secondary mt-10 text-center">
                        Don't have an account?
                        <a href="{{ url('register') }}" class="text-brand font-bold hover:underline ml-1">Create account</a>
                    </p>

                </div>
            </div>

        </div>
    </section>
@endsection
