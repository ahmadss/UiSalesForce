import 'package:flutter/material.dart';
import 'package:salesforce/model/WalletAppModel.dart';
import 'package:salesforce/screen/WAListProduckScreen.dart';

List<String?> waMonthList = <String?>["Jan", "Feb", "Mar", "April", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
List<String?> waYearList = <String?>["1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2020", "2021"];
List<String?> waOrgList = <String?>["All", "Water", "Gas", "Electricity", "Internet", "Education", "Landline"];
List<String?> amountList = ["500", "1000", "800"];
List<String?> overViewList = ["All", "Weekly", "Yearly", "Daily", "Monthly"];

List<WAWalkThroughModel> waWalkThroughList() {
  List<WAWalkThroughModel> list = [];
  list.add(WAWalkThroughModel(
      title: "Easily Accessible", description: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.", image: 'images/walletApp/wa_walkthorugh.png'));
  list.add(WAWalkThroughModel(
      title: "Mange Anytime", description: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.", image: 'images/walletApp/wa_walkthorugh.png'));
  list.add(WAWalkThroughModel(
      title: "Safe Transaction", description: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.", image: 'images/walletApp/wa_walkthorugh.png'));

  return list;
}

List<WACardModel> waCardList() {
  List<WACardModel> cardList = [];
  cardList.add(WACardModel(balance: '\$12,00,000', cardNumber: '123 985 7654327', date: '03/23', color: Color(0xFF6C56F9)));
  cardList.add(WACardModel(balance: '\$12,23,000', cardNumber: '985 123 7654327', date: '25/23', color: Color(0xFFFF7426)));
  cardList.add(WACardModel(balance: '\$23,00,000', cardNumber: '765 123 9854327', date: '03/25', color: Color(0xFF26C884)));
  return cardList;
}


List<WATransactionModel> waTransactionList() {
  List<WATransactionModel> transactionList = [];
  transactionList.add(WATransactionModel(
    color: Color(0xFFFF7426),
    title: 'Send Money to',
    image: 'images/walletApp/wa_bill_pay.png',
    balance: '-\$20,000',
    name: 'James',
    time: 'Today 5:30 PM',
  ));
  transactionList.add(WATransactionModel(
    color: Color(0xFF26C884),
    title: 'Salary from',
    image: 'images/walletApp/wa_voucher.png',
    balance: '+\$50,000',
    name: 'Unbox Digital',
    time: 'Today 6:30 PM',
  ));
  return transactionList;
}

List<WARecentPayeesModel> waRecentPayeesList() {
  List<WARecentPayeesModel> list = [];
  list.add(WARecentPayeesModel(image: 'https://www.vrsiddhartha.ac.in/me/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg', name: 'John', number: '123456789'));
  list.add(WARecentPayeesModel(image: 'https://royalrajtravels.com/image/1613583503main-qimg-6291c3a117fc230c82785148baef7eed.jpg', name: 'Rose', number: '78571237'));
  list.add(WARecentPayeesModel(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU', name: 'Willam', number: '456123522'));
  list.add(WARecentPayeesModel(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU', name: 'Willam', number: '5568553522'));
  list.add(WARecentPayeesModel(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU', name: 'Willam', number: '852123522'));
  list.add(WARecentPayeesModel(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIuNPlLLXKdjlBivtZzQxsq-hW9E6YbooFXqDqST7AfuSHGcN45DIDTi5qeLOQHNrNR9g&usqp=CAU', name: 'Rose', number: '4561222222'));
  list.add(WARecentPayeesModel(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw9jzCKDNeX4QbAQOAABXMML3djP3ZVEv1-rpbKgfyNCshsC-zhB3Ta2JXdMxvvSOFszg&usqp=CAU', name: 'Bella', number: '98561233'));
  return list;
}

List<WABillPayModel> waBillPayList() {
  List<WABillPayModel> list = [];
  list.add(WABillPayModel(title: 'Water', color: Colors.blue, image: 'images/walletApp/wa_water.png'));
  list.add(WABillPayModel(title: 'Gas', color: Color(0xFFFF7426), image: 'images/walletApp/wa_gas.png'));
  list.add(WABillPayModel(title: 'Electricity', color: Colors.yellow, image: 'images/walletApp/wa_electricity.png'));
  list.add(WABillPayModel(title: 'Internet', color: Colors.pink, image: 'images/walletApp/wa_internet.png'));
  list.add(WABillPayModel(title: 'Education', color: Colors.green, image: 'images/walletApp/wa_education.png'));
  list.add(WABillPayModel(title: 'Landline', color: Colors.lightBlueAccent, image: 'images/walletApp/wa_landline.png'));
  return list;
}

List<WAOrganizationModel> waOrganizationList() {
  List<WAOrganizationModel> list = [];
  list.add(WAOrganizationModel.fromModel(title: 'Belanja : ', subTitle: '2021-11-03 12:11:00', title2: 'Document No : ', subTitle2: '0F/21/11/100002', title3: 'Busines Partner : ', subTitle3: 'Atlas MDN', title4: 'Standard Order : ', subTitle4: ' - ', title5: 'Total Belanja : ', subTitle5: 'Rp. 450.000'));
  list.add(WAOrganizationModel.fromModel(title: 'Belanja : ', subTitle: '2021-11-03 12:11:00', title2: 'Document No : ', subTitle2: '0F/21/11/100002', title3: 'Busines Partner : ', subTitle3: 'Atlas MDN', title4: 'Standard Order : ', subTitle4: ' - ', title5: 'Total Belanja : ', subTitle5: 'Rp. 450.000'));
  list.add(WAOrganizationModel.fromModel(title: 'Belanja : ', subTitle: '2021-11-03 12:11:00', title2: 'Document No : ', subTitle2: '0F/21/11/100002', title3: 'Busines Partner : ', subTitle3: 'Atlas MDN', title4: 'Standard Order : ', subTitle4: ' - ', title5: 'Total Belanja : ', subTitle5: 'Rp. 450.000'));
  list.add(WAOrganizationModel.fromModel(title: 'Belanja : ', subTitle: '2021-11-03 12:11:00', title2: 'Document No : ', subTitle2: '0F/21/11/100002', title3: 'Busines Partner : ', subTitle3: 'Atlas MDN', title4: 'Standard Order : ', subTitle4: ' - ', title5: 'Total Belanja : ', subTitle5: 'Rp. 450.000'));
  list.add(WAOrganizationModel.fromModel(title: 'Belanja : ', subTitle: '2021-11-03 12:11:00', title2: 'Document No : ', subTitle2: '0F/21/11/100002', title3: 'Busines Partner : ', subTitle3: 'Atlas MDN', title4: 'Standard Order : ', subTitle4: ' - ', title5: 'Total Belanja : ', subTitle5: 'Rp. 450.000'));
  return list;
}

List<WABillPayModel> waSelectBillList() {
  List<WABillPayModel> list = [];
  list.add(WABillPayModel(title: 'CityBank', image: 'images/walletApp/wa_city_bank_image.png'));
  list.add(WABillPayModel(title: 'Bank of America', image: 'images/walletApp/wa_bank_of_america.png'));
  list.add(WABillPayModel(title: 'Yes Bank', image: 'images/walletApp/wa_yes_bank.png'));
  return list;
}

List<WACardModel> waSendViaCardList() {
  List<WACardModel> list = [];
  list.add(WACardModel(balance: '\$12,00,000', cardNumber: '123 985 7654327', date: '03/23', color: Color(0xFF6C56F9), image: 'images/walletApp/wa_card.png'));
  list.add(WACardModel(balance: '\$12,23,000', cardNumber: '985 123 7654327', date: '25/23', color: Color(0xFFFF7426), image: 'images/walletApp/wa_card.png'));
  list.add(WACardModel(balance: '\$23,00,000', cardNumber: '765 123 9854327', date: '03/25', color: Color(0xFF26C884), image: 'images/walletApp/wa_card.png'));
  return list;
}

List<WAWalletUserModel> waWalletUserList() {
  List<WAWalletUserModel> list = [];
  list.add(WAWalletUserModel(image: "https://www.vrsiddhartha.ac.in/me/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg"));
  list.add(WAWalletUserModel(image: "https://royalrajtravels.com/image/1613583503main-qimg-6291c3a117fc230c82785148baef7eed.jpg"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXs_iIewEiaZ3tXb6n6VgaUIONS0B0HjwsqcvA3-EnnaNm0BwX216u2dZl2QTHnP7VOIU&usqp=CAU"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WAWalletUserModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  return list;
}

List<WATransactionModel> waCategoriesList() {
  List<WATransactionModel> list = [];
  list.add(WATransactionModel(color: Color(0xFF26C884), title: 'Clothes', image: 'images/walletApp/wa_clothes.png', balance: '-\$10,000', time: 'Today 12:30 PM'));
  list.add(WATransactionModel(color: Color(0xFFFF7426), title: 'Grocery', image: 'images/walletApp/wa_food.png', balance: '-\$8,000', time: 'Today 1:02 PM'));
  return list;
}


List<WAOperationsModel> waOperationList() {
  List<WAOperationsModel> operationModel = [];
  operationModel.add(WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Tekiro',
    image: 'images/walletApp/wa_transfer.png',
    widget: WAListproduckScreen(),
  ));

  operationModel.add(WAOperationsModel(
    color: Color(0xFFFF7426),
    title: 'Ryu Accessories',
    image: 'images/walletApp/wa_voucher.png',
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Ryu Engine',
    image: 'images/walletApp/wa_ticket.png',
    widget: WAListproduckScreen(),
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF26C884),
    title: 'Ryu Powertool',
    image: 'images/walletApp/wa_bill_pay.png',
    widget: WAListproduckScreen(),
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Rexco',
    image: 'images/walletApp/wa_ticket.png',
    widget: WAListproduckScreen(),
  ));


  return operationModel;
}

List<WAVoucherModel> waVouchersList() {
  List<WAVoucherModel> list = [];
  list.add(WAVoucherModel(image: 'images/walletApp/wa_zara.png', title: 'Tekiro', discountText: '10% Off', expireTime: 'Expires on 15 June', pointsText: 'For 1500 points'));
  list.add(WAVoucherModel(image: 'images/walletApp/wa_macdonals.jpeg', title: 'Ryu Accesscoris', discountText: '5% Off', expireTime: 'Expires on 20 June', pointsText: 'For 600 points'));
  list.add(WAVoucherModel(image: 'images/walletApp/wa_macdonals.jpeg', title: 'Ryu Engine', discountText: '5% Off', expireTime: 'Expires on 20 June', pointsText: 'For 600 points'));
  list.add(WAVoucherModel(image: 'images/walletApp/wa_zara.png', title: 'Ryu Powertool', discountText: '10% Off', expireTime: 'Expires on 15 June', pointsText: 'For 1500 points'));
  // list.add(WAVoucherModel(image: 'images/walletApp/wa_zara.png', title: 'Ryu Welding', discountText: '10% Off', expireTime: 'Expires on 15 June', pointsText: 'For 1500 points'));
  return list;
}
