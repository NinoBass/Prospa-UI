import 'package:intl/intl.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';

class TransactionDto {
  TransactionDto({
    required this.amount,
    required this.icon,
    required this.description,
    required this.dateCreated,
  });

  String icon;
  String amount;
  DateTime dateCreated;
  String description;

  String get time => DateFormat('h:mm a').format(dateCreated);
}

DateTime today = DateTime.now();

DateTime getDate(int offset) => today.subtract(Duration(days: offset));

final dummyTransactions = <TransactionDto>[
  TransactionDto(
    icon: bankIcon,
    amount: '145.90',
    description: 'Transfer Fee',
    dateCreated: today,
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Adam Chapman',
    dateCreated: today,
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Shirley Barnes',
    dateCreated: getDate(1),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Akanni Samuel',
    dateCreated: getDate(1),
  ),
  TransactionDto(
    icon: internetIcon,
    amount: '145.90',
    description: 'Internet & Telephone',
    dateCreated: getDate(1),
  ),
  TransactionDto(
    icon: gavelIcon,
    amount: '5000.00',
    description: 'Legal',
    dateCreated: getDate(2),
  ),
  TransactionDto(
    icon: bankIcon,
    amount: '145.90',
    description: 'Transfer Fee',
    dateCreated: getDate(2),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Adam Chapman',
    dateCreated: getDate(3),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Shirley Barnes',
    dateCreated: getDate(3),
  ),
  TransactionDto(
    icon: gavelIcon,
    amount: '5000.00',
    description: 'Legal',
    dateCreated: getDate(4),
  ),
  TransactionDto(
    icon: bankIcon,
    amount: '145.90',
    description: 'Transfer Fee',
    dateCreated: getDate(4),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Adam Chapman',
    dateCreated: getDate(4),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Shirley Barnes',
    dateCreated: getDate(5),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Akanni Samuel',
    dateCreated: getDate(5),
  ),
  TransactionDto(
    icon: internetIcon,
    amount: '145.90',
    description: 'Internet & Telephone',
    dateCreated: getDate(5),
  ),
  TransactionDto(
    icon: gavelIcon,
    amount: '5000.00',
    description: 'Legal',
    dateCreated: getDate(5),
  ),
  TransactionDto(
    icon: bankIcon,
    amount: '145.90',
    description: 'Transfer Fee',
    dateCreated: getDate(6),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Adam Chapman',
    dateCreated: getDate(6),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Shirley Barnes',
    dateCreated: getDate(6),
  ),
  TransactionDto(
    icon: exchangeIcon,
    amount: '2000.00',
    description: 'Akanni Samuel',
    dateCreated: getDate(7),
  ),
  TransactionDto(
    icon: internetIcon,
    amount: '145.90',
    description: 'Internet & Telephone',
    dateCreated: getDate(7),
  ),
];
