import 'package:prospa_assessment/src/presentation/resources/res.dart';

class DashboardTab {
  const DashboardTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
  final String label;
  final String icon;
  final String activeIcon;
}

const dashboardTabs = <DashboardTab>[
  DashboardTab(
    label: 'Accounts',
    icon: accountsIcon,
    activeIcon: accountsIcon,
  ),
  DashboardTab(
    label: 'Transfer',
    icon: transferIcon,
    activeIcon: transferIcon,
  ),
  DashboardTab(
    label: 'Invoice',
    icon: invoiceIcon,
    activeIcon: invoiceIcon,
  ),
  DashboardTab(
    label: 'More',
    icon: wandIcon,
    activeIcon: wandIcon,
  ),
];
