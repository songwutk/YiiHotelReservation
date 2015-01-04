<?php

/**
 * This is the model class for table "reservationdetails".
 *
 * The followings are the available columns in table 'reservationdetails':
 * @property integer $id
 * @property integer $reservationid
 * @property string $title
 * @property string $firstname
 * @property string $lastname
 * @property string $contactnumber
 * @property string $emailaddress
 * @property string $postaddress
 * @property string $city
 * @property string $county
 * @property string $country
 * @property string $postcode
 * @property string $otherinfo
 *
 * The followings are the available model relations:
 * @property Reservation $reservation
 */
class ReservationDetails extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'reservationdetails';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('reservationid, title, firstname, lastname, contactnumber, emailaddress, postaddress, city, county, country, postcode, otherinfo', 'required'),
			array('reservationid', 'numerical', 'integerOnly'=>true),
			array('title', 'length', 'max'=>15),
			array('firstname, lastname, emailaddress, postaddress, city, county, country, otherinfo', 'length', 'max'=>255),
			array('contactnumber', 'length', 'max'=>20),
			array('postcode', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, reservationid, title, firstname, lastname, contactnumber, emailaddress, postaddress, city, county, country, postcode, otherinfo', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'reservation' => array(self::BELONGS_TO, 'Reservation', 'reservationid'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'reservationid' => 'รหัสรายการ',
			'title' => 'คำนำหน้าชื่อ',
			'firstname' => 'ชื่อ',
			'lastname' => 'นามสกุล',
			'contactnumber' => 'เบอร์ติดต่อ',
			'emailaddress' => 'Email',
			'postaddress' => 'ที่อยู่ทางไปรษณีย์',
			'city' => 'จังหวัด',
			'county' => 'County',
			'country' => 'ประเทศ',
			'postcode' => 'รหัสไปรษณีย์',
			'otherinfo' => 'ข้อมูลเสริม',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('reservationid',$this->reservationid);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('firstname',$this->firstname,true);
		$criteria->compare('lastname',$this->lastname,true);
		$criteria->compare('contactnumber',$this->contactnumber,true);
		$criteria->compare('emailaddress',$this->emailaddress,true);
		$criteria->compare('postaddress',$this->postaddress,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('county',$this->county,true);
		$criteria->compare('country',$this->country,true);
		$criteria->compare('postcode',$this->postcode,true);
		$criteria->compare('otherinfo',$this->otherinfo,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ReservationDetails the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
