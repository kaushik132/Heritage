<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: DejaVu Sans, sans-serif; font-size: 13px; color: #1F2937; background: #fff; }

        .header { background: #1F2937; color: #fff; padding: 24px 32px; display: flex; justify-content: space-between; align-items: center; }
        .header h1 { font-size: 22px; font-weight: bold; }
        .header .brand { color: #C8A96E; }
        .header .invoice-info { text-align: right; font-size: 12px; color: #9ca3af; }
        .header .invoice-info strong { color: #fff; font-size: 14px; display: block; }

        .body { padding: 28px 32px; }

        .info-grid { display: flex; justify-content: space-between; margin-bottom: 24px; gap: 20px; }
        .info-box { flex: 1; }
        .info-box h4 { font-size: 11px; text-transform: uppercase; letter-spacing: 1px; color: #6b7280; margin-bottom: 6px; border-bottom: 1px solid #e5e7eb; padding-bottom: 4px; }
        .info-box p { font-size: 13px; color: #374151; line-height: 1.6; }
        .info-box strong { color: #1F2937; }

        .status-badge { display: inline-block; border: 1px solid #C8A96E; color: #C8A96E; border-radius: 20px; padding: 2px 10px; font-size: 11px; margin-top: 4px; }

        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        thead tr { background: #1F2937; color: #fff; }
        thead th { padding: 10px 12px; text-align: left; font-size: 12px; font-weight: 600; }
        tbody tr { border-bottom: 1px solid #f3f4f6; }
        tbody tr:nth-child(even) { background: #f9fafb; }
        tbody td { padding: 10px 12px; font-size: 13px; color: #374151; }

        .totals { float: right; width: 260px; }
        .totals table { margin-bottom: 0; }
        .totals td { padding: 6px 12px; font-size: 13px; }
        .totals .total-row td { font-weight: bold; font-size: 15px; border-top: 2px solid #1F2937; color: #1F2937; }
        .totals .brand-color { color: #C8A96E; }

        .clearfix { clear: both; }

        .footer { margin-top: 40px; border-top: 1px solid #e5e7eb; padding-top: 16px; text-align: center; font-size: 11px; color: #9ca3af; }

        .badge-cod { background: #dcfce7; color: #15803d; padding: 2px 8px; border-radius: 10px; font-size: 11px; }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <div>
            <h1>Heritage <span class="brand">Textiles</span></h1>
            <p style="font-size:11px; color:#9ca3af; margin-top:4px;">Premium Fabrics Since 2011</p>
        </div>
        <div class="invoice-info">
            <strong>INVOICE</strong>
            #{{ $order->order_number }}
            <p style="margin-top:4px;">{{ $order->created_at->format('d M Y') }}</p>
        </div>
    </div>

    <div class="body">

        <!-- Info Grid -->
        <div class="info-grid">
            <div class="info-box">
                <h4>Billed To</h4>
                <p>
                    <strong>{{ $order->first_name }} {{ $order->last_name }}</strong><br>
                    {{ $order->street_address }}<br>
                    {{ $order->city }}, {{ $order->state }} - {{ $order->zip_code }}<br>
                    {{ $order->country }}<br>
                    {{ $order->phone }}<br>
                    {{ $order->email }}
                </p>
            </div>

            <div class="info-box" style="text-align:right;">
                <h4>Order Details</h4>
                <p>
                    <strong>Order #{{ $order->order_number }}</strong><br>
                    Date: {{ $order->created_at->format('d M Y') }}<br>
                    Payment: <span class="badge-cod">{{ strtoupper($order->payment_method) }}</span><br>
                    Status: <span class="status-badge">{{ $order->status_label }}</span>
                </p>
            </div>
        </div>

        <!-- Items Table -->
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th style="text-align:right;">Total</th>
                </tr>
            </thead>
            <tbody>
                @foreach($order->items as $index => $item)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $item->product_name }}</td>
                    <td>{{ $item->quantity }} meters</td>
                    <td>₹{{ number_format($item->price, 2) }}</td>
                    <td style="text-align:right;">₹{{ number_format($item->total, 2) }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <!-- Totals -->
        <div class="totals">
            <table>
                <tr>
                    <td>Subtotal</td>
                    <td style="text-align:right;">₹{{ number_format($order->subtotal, 2) }}</td>
                </tr>
                <tr>
                    <td>GST (18%)</td>
                    <td style="text-align:right;">+₹{{ number_format($order->tax, 2) }}</td>
                </tr>
                @if($order->discount > 0)
                <tr>
                    <td>Discount</td>
                    <td style="text-align:right; color:#15803d;">-₹{{ number_format($order->discount, 2) }}</td>
                </tr>
                @endif
                <tr class="total-row">
                    <td>Total</td>
                    <td style="text-align:right;" class="brand-color">₹{{ number_format($order->total, 2) }}</td>
                </tr>
            </table>
        </div>

        <div class="clearfix"></div>

        <!-- Footer -->
        <div class="footer">
            <p>Thank you for shopping with Heritage Textiles!</p>
            <p style="margin-top:4px;">Jaipur, Rajasthan, India &nbsp;|&nbsp; hello@heritagetextiles.com &nbsp;|&nbsp; +91-98295-60549</p>
            <p style="margin-top:4px;">© {{ date('Y') }} Heritage Textiles. All rights reserved.</p>
        </div>

    </div>

</body>
</html>
