<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; background: #f5f5f5; margin: 0; padding: 0; }
        .wrapper { max-width: 560px; margin: 40px auto; background: #fff; border: 1px solid #e5e5e5; }
        .header { background: #1F2937; padding: 30px 40px; }
        .header h1 { color: #fff; font-size: 20px; margin: 0; font-weight: bold; }
        .header span { color: #C8A96E; }
        .body { padding: 40px; }
        .body h2 { color: #1F2937; font-size: 22px; margin-bottom: 8px; }
        .body p { color: #6b7280; font-size: 14px; line-height: 1.7; margin-bottom: 16px; }
        .btn { display: inline-block; background: #C8A96E; color: #fff !important; text-decoration: none; padding: 14px 32px; font-size: 14px; font-weight: bold; margin: 20px 0; }
        .divider { border: none; border-top: 1px solid #e5e5e5; margin: 24px 0; }
        .link-box { background: #f9f9f9; border: 1px solid #e5e5e5; padding: 12px 16px; font-size: 12px; color: #6b7280; word-break: break-all; }
        .footer { padding: 20px 40px; background: #f9f9f9; border-top: 1px solid #e5e5e5; }
        .footer p { color: #9ca3af; font-size: 12px; margin: 0; }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="header">
            <h1>Heritage <span>Textiles</span></h1>
        </div>
        <div class="body">
            <h2>Reset Your Password</h2>
            <p>Hello <strong>{{ $userName }}</strong>,</p>
            <p>We received a request to reset the password for your Heritage Textiles account. Click the button below to set a new password.</p>

            <a href="{{ $resetUrl }}" class="btn">Reset My Password</a>

            <p>This link will expire in <strong>60 minutes</strong>. If you did not request a password reset, you can safely ignore this email.</p>

            <hr class="divider">

            <p style="font-size:12px; color:#9ca3af;">If the button doesn't work, copy and paste this link into your browser:</p>
            <div class="link-box">{{ $resetUrl }}</div>
        </div>
        <div class="footer">
            <p>© 2026 Heritage Textiles. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
