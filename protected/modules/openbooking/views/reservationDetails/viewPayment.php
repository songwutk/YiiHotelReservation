<?php
$this->breadcrumbs=array(
	'Reservationdetails'=>array('index'),
	$reservation->reservationDetails->title,
);
?>

<div class="row">
	<div class="span6">
		<h1>โปรดชำระเงินเพื่อยืนยันการจอง</h1>
	</div>
	<div class="span6">
		<h1>แจ้งชำระเงินที่นี่</h1>
	</div>
</div>

<div class="row">
	<div class="span5">
		<!-- Loop through payment options -->
		<h3>PayPal</h3>
		<h3>Google Checkout</h3>
		<h3>Bitcoin</h3>
	</div>
	
	<div class="span6 well">
		<table class="table">
		  <thead>
		    <tr>
		      <th>ประเภทห้องพัก</th>
		      <th>วันเข้าพัก</th>
		      <th>วันออก</th>
		      <th>ยอดที่ต้องชำระ</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td><?php echo $reservation->roomtype->description ?></td>
		      <td><?php echo $reservation->datefrom ?></td>
		      <td><?php echo $reservation->dateto ?></td>
		      <td><?php echo $reservation->onlinepayment ?></td>
		    </tr>
		  </tbody>
		</table>
		
		<?php 
		$this->widget('zii.widgets.CDetailView',array(
			'data'=>$reservation->reservationDetails,
			'attributes'=>array(
				'reservationid',
				'title',
				'firstname',
				'lastname',
				'contactnumber',
				'emailaddress',
				'postaddress',
				'city',
				'county',
				'country',
				'postcode',
				'otherinfo',
			),
		)); 
		?>
	</div>

</div>
