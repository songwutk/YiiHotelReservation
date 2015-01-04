<?php
$this->breadcrumbs=array(
	'Reservationdetails'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Reservationdetails','url'=>array('index')),
	array('label'=>'Manage Reservationdetails','url'=>array('admin')),
);

?>
<h1>รายละเอียดการจองห้อง</h1>

<table class="table">
  <thead>
    <tr>
      <th>ประเภทห้อง</th>
      <th>เข้าพัก</th>
      <th>คืนห้อง</th>
      <th>ยอดชำระ</th>
      <th>จำนวนคืนที่พัก</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><?php echo $model->reservation->roomtype->description ?></td>
      <td><?php echo $model->reservation->datefrom ?></td>
      <td><?php echo $model->reservation->dateto ?></td>
      <td><?php echo $model->reservation->onlinepayment ?></td>
      <td><?php echo $model->reservation->roomsavailable ?></td>
    </tr>
  </tbody>
</table>

<?php echo $this->renderPartial('_form', array('model'=>$model,'reservation'=>$model->reservation)); ?>