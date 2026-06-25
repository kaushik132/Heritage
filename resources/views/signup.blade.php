@extends('dashboard.layout.main')
@section('content')
    <section class="min-h-screen flex items-center justify-center bg-light" x-data="{ showPass: false, showConfirm: false, accountType: 'retail' }">
        <div class="flex w-full max-w-5xl bg-white shadow-none border border-border overflow-hidden">

            <div class="flex-1 flex items-center justify-center px-8 py-10">
                <div class="w-full max-w-md">
                    <h1 class="text-[28px] font-bold text-primary mb-1">Create Account</h1>
                    <p class="text-secondary text-[13px] mb-8">Join Heritage Textiles — premium fabrics at your fingertips
                    </p>

                    <div class="flex border border-border mb-6 bg-light">
                        <button @click="accountType = 'retail'"
                            :class="accountType === 'retail' ? 'bg-brand text-white' : 'text-secondary hover:text-primary'"
                            class="flex-1 py-3 text-[12px] font-bold  tracking-widest transition-all">
                            Retail Customer
                        </button>
                        <button @click="accountType = 'wholesale'"
                            :class="accountType === 'wholesale' ? 'bg-brand text-white' : 'text-secondary hover:text-primary'"
                            class="flex-1 py-3 text-[12px] font-bold  tracking-widest transition-all border-l border-border">
                            Wholesale Buyer
                        </button>
                    </div>
                    <form method="POST" action="{{ route('register.post') }}">
                        @csrf

{{-- Validation errors show karo, top mein add karo --}}
@if ($errors->any())
    <div class="mb-4 p-3 bg-red-50 border border-red-200 text-red-700 text-[12px] space-y-1">
        @foreach ($errors->all() as $error)
            <p>• {{ $error }}</p>
        @endforeach
    </div>
@endif
{{-- Account type hidden input --}}
<input type="hidden" name="account_type" :value="accountType" />

                        <div class="space-y-5">
                            <div class="grid grid-cols-2 gap-4">
                                <div class="space-y-1">
                                    <label class="text-[11px] font-bold text-primary  tracking-wider">First Name</label>
                                    <input type="text" name="first_name" placeholder="First name" value="{{ old('first_name') }}"
                                        class="w-full border border-border rounded-none px-4 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                                </div>
                                <div class="space-y-1">
                                    <label class="text-[11px] font-bold text-primary  tracking-wider">Last Name</label>
                                    <input type="text" name="last_name"  placeholder="Last name" value="{{ old('last_name') }}"
                                        class="w-full border border-border rounded-none px-4 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                                </div>
                            </div>

                            <div class="space-y-1">
                                <label class="text-[11px] font-bold text-primary  tracking-wider">Email Address</label>
                                <input type="email" name="email" placeholder="Enter your email" value="{{old('email')}}"
                                    class="w-full border border-border rounded-none px-4 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                            </div>

                            <div class="space-y-1">
                                <label class="text-[11px] font-bold text-primary  tracking-wider">Phone Number</label>
                                <input type="tel" name="phone" placeholder="+91 00000 00000" maxlength="10" value="{{ old('phone') }}"
                                    class="w-full border border-border rounded-none px-4 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                            </div>

                            <div x-show="accountType === 'wholesale'" x-transition class="space-y-5">
                                <div class="space-y-1">
                                    <label class="text-[11px] font-bold text-primary  tracking-wider">Business Name</label>
                                    <input type="text" name="business_name" placeholder="Your business name"  value="{{ old('business_name') }}"
                                        class="w-full border border-border rounded-none px-4 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                                </div>
                                <div class="space-y-1">
                                    <label class="text-[11px] font-bold text-primary  tracking-wider">GST Number</label>
                                    <input type="text" name="gst_number" placeholder="Enter GST number" value="{{ old('gst_number') }}"
                                        class="w-full border border-border rounded-none px-4 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                                </div>
                            </div>

                            <div class="space-y-1">
                                <label class="text-[11px] font-bold text-primary  tracking-wider">Password</label>
                                <div class="relative">
                                    <input name="password" :type="showPass ? 'text' : 'password'" placeholder="Create a password"
                                        class="w-full border border-border rounded-none px-4 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors pr-10" />
                                    <button @click="showPass = !showPass" type="button"
                                        class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary">
                                        <iconify-icon :icon="showPass ? 'lucide:eye-off' : 'lucide:eye'"
                                            width="16"></iconify-icon>
                                    </button>
                                </div>
                            </div>

                            <div class="flex items-start gap-3 pt-2">
                                <input type="checkbox" name="terms" id="terms"
                                    class="mt-1 w-4 h-4 accent-brand border-border rounded-none" />
                                <label for="terms" class="text-[12px] text-secondary leading-normal">
                                    I agree to the <a href="#" class="text-brand font-bold hover:underline">Terms &
                                        Conditions</a> and <a href="#"
                                        class="text-brand font-bold hover:underline">Privacy Policy</a>
                                </label>
                            </div>

                            <button type="submit"
                                class="w-full bg-brand text-white text-[13px] font-bold  tracking-[2px] py-4 rounded-none hover:bg-primary transition-all shadow-none">
                                Create Account
                            </button>

                            {{-- <div class="flex items-center gap-3 py-2">
                        <div class="flex-1 border-t border-border"></div>
                        <span class="text-[10px] text-placeholder font-bold  tracking-[3px]">OR</span>
                        <div class="flex-1 border-t border-border"></div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <button class="flex items-center justify-center gap-2 border border-border rounded-none py-3 text-[12px] font-bold  text-primary hover:bg-light transition-colors">
                            <iconify-icon icon="logos:google-icon" width="16"></iconify-icon>
                            Google
                        </button>
                        <button class="flex items-center justify-center gap-2 border border-border rounded-none py-3 text-[12px] font-bold  text-primary hover:bg-light transition-colors">
                            <iconify-icon icon="logos:facebook" width="16"></iconify-icon>
                            Facebook
                        </button>
                    </div> --}}

                        </div>

                    </form>

                    <p class="text-center text-[12px] text-secondary mt-8  tracking-wider">
                        Already have an account?
                        <a href="login.php" class="text-brand font-bold hover:underline ml-1">Sign In</a>
                    </p>
                </div>
            </div>

            <div class="hidden lg:flex w-[40%] relative">
                <img src="https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?q=80&w=1000" alt="Textile Craft"
                    class="absolute inset-0 w-full h-full object-cover" />

                <div class="absolute inset-0 bg-primary/70"></div>

                <div class="relative z-10 flex flex-col justify-between p-12 w-full">
                    <a href="index.php">
                        <img src="assets/images/logo.png" alt="Heritage Textiles" class="h-10 w-auto" />
                    </a>

                    <div>
                        <div class="w-16 h-1 bg-brand mb-8"></div>
                        <h2 class="text-white text-[32px] font-bold mb-4">
                            Quality <br />Craftsmanship <br />Since 2011
                        </h2>
                        <p class="text-white/60 text-sm leading-relaxed">
                            Premium fabrics crafted by skilled artisans across India. Experience the heritage in every
                            thread.
                        </p>
                    </div>

                    <p class="text-white/30 text-[11px]  tracking-widest">© 2026 Heritage Textiles</p>
                </div>
            </div>

        </div>
    </section>
@endsection
