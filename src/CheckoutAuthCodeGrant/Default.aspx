<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<title>Blackbaud Checkout Demo </title>
</head>
<body>
	<h1>Blackbaud Checkout Demo</h1>
	Please select an amount:
	<select id="amount">
		<option value="25">$25</option>
		<option value="50">$50</option>
		<option value="100">$100</option>
	</select>
	<button id="donate-now">Donate now!</button>

	<script>
		document.addEventListener('DOMContentLoaded', function () {

			// create the transaction object
			let transactionData = {
				key: '0c38c5cc-baf2-405e-a7da-60912a40fd86',
				payment_configuration_id: 'f9fd6119-95f5-4940-bba1-038b4ac23dea',
				primary_color: '#569BBE',
				is_email_required: 1,
				is_name_required: 1
			};

			document.getElementById('donate-now').addEventListener('click', function (e) {
				e.preventDefault();

				// append any donor-entered information to the transaction obejct
				transactionData.Amount = document.getElementById('amount').value;

				// call the Checkout method to display the payment form
				Blackbaud_OpenCardNotPresentForm(transactionData);
			});

			document.addEventListener('checkoutReady', function () {
				// handle Ready event
			});

			document.addEventListener('checkoutLoaded', function () {
				// handle Loaded event
			});

			document.addEventListener('checkoutCancel', function () {
				// handle Cancel event
			});

			document.addEventListener('checkoutComplete', function (e) {
				// handle Complete event
				console.log('transaction token: ', e.detail.transactionToken);
			});

			document.addEventListener('checkoutError', function (e) {
				// handle Error event
				console.log('error text: ', e.detail.errorText);
				console.log('error code: ', e.detail.errorCode);
			});
		});
	</script>

	<script src="https://payments.blackbaud.com/Checkout/bbCheckout.2.0.js"></script>
</body>
</html>
