@include('dashboard.layout.header')
@if(session('toast_success'))
<script>
    document.addEventListener('DOMContentLoaded', function() {
        showToast("{{ session('toast_success') }}", 'success');
    });
</script>
@endif
@yield('content')
@include('dashboard.layout.footer')
