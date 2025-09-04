import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sharecars/core/api/dio_consumer.dart';
import 'package:sharecars/features/report/data/data_source/report_remote_data_source.dart';
import 'package:sharecars/features/report/data/model/date_range.dart';
import 'package:sharecars/features/report/data/model/financial_stats.dart';
import 'package:sharecars/features/report/data/model/ride_stats.dart';
import 'package:sharecars/features/report/data/repo/report_repo_im.dart';
import 'package:sharecars/features/report/domain/repo/auth_repo.dart';
import 'package:sharecars/features/report/presentation/manger/report_cubit/report_cubit.dart';


class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  void initState() {
    super.initState();
   
    context.read<ReportCubit>().getreport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تقرير النظام',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 4,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.refresh, color: Colors.white),
          //   onPressed: () {
          //     context.read<ReportCubit>().getreport();
          //   },
          // ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: BlocBuilder<ReportCubit, ReportState>(
          builder: (context, state) {
            if (state is ReportLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'جاري تحميل التقرير...',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }
print('''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''');
            if (state is ReportError) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red[200]!),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red[600],
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'خطأ في تحميل التقرير',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.message,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<ReportCubit>().getreport();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('إعادة المحاولة'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[600],
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is ReportSuccess) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // معلومات الفترة الزمنية
                    _buildDateRangeCard(state.reportResponse.reportData.dateRange),
                    
                    const SizedBox(height: 20),
                    
                    // إحصائيات الرحلات
                    _buildRideStatsTable(state.reportResponse.reportData.rideStats),
                    
                    const SizedBox(height: 20),
                    
                    // الإحصائيات المالية
                    _buildFinancialStatsTable(state.reportResponse.reportData.financialStats),
                    
                    const SizedBox(height: 20),
                    
                    // معلومات التصحيح
                    _buildDebugInfoTable(state.reportResponse.reportData.financialStats.debugInfo),
                  ],
                ),
              );
            }

            return Center(
              child: Text(
                'مرحباً بك في صفحة التقارير',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateRangeCard(DateRange dateRange) {
    return Card(
      elevation: 4,
      shadowColor: Colors.blue[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.blue[600]!, Colors.blue[800]!],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.date_range, color: Colors.white, size: 28),
                SizedBox(width: 12),
                Text(
                  'الفترة الزمنية للتقرير',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDateInfo('تاريخ البداية', dateRange.start ?? 'غير محدد'),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildDateInfo('تاريخ النهاية', dateRange.end ?? 'غير محدد'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateInfo(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRideStatsTable(RideStats rideStats) {
    return _buildTableCard(
      title: 'إحصائيات الرحلات',
      icon: Icons.directions_car,
      color: Colors.green[600]!,
      children: [
        _buildStatsTable([
          _buildTableRow('إجمالي الرحلات', rideStats.total.toString(), Colors.blue[600]!),
          _buildTableRow('الرحلات المكتملة', rideStats.completed.toString(), Colors.green[600]!),
          _buildTableRow('الرحلات النشطة', rideStats.active.toString(), Colors.orange[600]!),
          _buildTableRow('في انتظار التأكيد', rideStats.awaitingConfirmation.toString(), Colors.yellow[700]!),
          _buildTableRow('الرحلات المُلغاة', rideStats.canceled.toString(), Colors.red[600]!),
        ]),
      ],
    );
  }

  Widget _buildFinancialStatsTable(FinancialStats financialStats) {
    return _buildTableCard(
      title: 'الإحصائيات المالية',
      icon: Icons.account_balance_wallet,
      color: Colors.purple[600]!,
      children: [
        // جدول SyCash
        Text(
          'محفظة SyCash',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.purple[700],
          ),
        ),
        const SizedBox(height: 12),
        _buildStatsTable([
          _buildTableRow('الرصيد الحالي', '${_formatCurrency(financialStats.sycash.currentBalance)}', Colors.green[600]!),
          _buildTableRow('إجمالي رسوم إنشاء الرحلات', '${_formatCurrency(financialStats.sycash.totalRideCreationFees)}', Colors.blue[600]!),
        ]),
        
        const SizedBox(height: 20),
        
        // جدول محفظة الإدارة
        Text(
          'محفظة الإدارة',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.purple[700],
          ),
        ),
        const SizedBox(height: 12),
        _buildStatsTable([
          _buildTableRow('الرصيد الحالي', '${_formatCurrency(financialStats.adminWallet.currentBalance)}', Colors.green[600]!),
          _buildTableRow('إجمالي الحجوزات المحصلة', '${_formatCurrency(financialStats.adminWallet.totalBookingCollected)}', Colors.blue[600]!),
          _buildTableRow('إجمالي الحجوزات المحولة', '${_formatCurrency(financialStats.adminWallet.totalBookingTransferred)}', Colors.orange[600]!),
        ]),
        
        const SizedBox(height: 20),
        
        // مبلغ الرحلات النشطة
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.yellow[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.yellow[300]!),
          ),
          child: Row(
            children: [
              Icon(Icons.warning_amber, color: Colors.yellow[700]),
              const SizedBox(width: 12),
              const Text(
                'مبلغ الرحلات النشطة: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                '${_formatCurrency(financialStats.activeRidesAmount)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDebugInfoTable(DebugInfo debugInfo) {
    return _buildTableCard(
      title: 'معلومات التصحيح',
      icon: Icons.bug_report,
      color: Colors.orange[600]!,
      children: [
        // طرق حساب التحويل
        Text(
          'طرق حساب التحويل',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange[700],
          ),
        ),
        const SizedBox(height: 12),
        _buildStatsTable([
          _buildTableRow('حسب نوع المعاملة', '${_formatCurrency(debugInfo.transferCalculationMethods.byTransactionType)}', Colors.blue[600]!),
          _buildTableRow('حسب الوصف', '${_formatCurrency(debugInfo.transferCalculationMethods.byDescription)}', Colors.green[600]!),
          _buildTableRow('المستخدم النهائي', '${_formatCurrency(debugInfo.transferCalculationMethods.finalUsed)}', Colors.purple[600]!),
        ]),
        
        const SizedBox(height: 20),
        
        // أنواع معاملات الإدارة
        Text(
          'أنواع معاملات الإدارة',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange[700],
          ),
        ),
        const SizedBox(height: 12),
        _buildStatsTable([
          _buildTableRow('عدد الائتمانات', debugInfo.adminTransactionTypes.adminCredit.count.toString(), Colors.blue[600]!),
          _buildTableRow('إجمالي مبلغ الائتمانات', '${_formatCurrency(debugInfo.adminTransactionTypes.adminCredit.totalAmount)}', Colors.green[600]!),
        ]),
      ],
    );
  }

  Widget _buildTableCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 6,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: color, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildStatsTable(List<TableRow> rows) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Table(
        columnWidths: {
          0: const FlexColumnWidth(2),
          1: const FlexColumnWidth(1),
        },
        children: [
          // رأس الجدول
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            children: [
              _buildTableHeader('البيان'),
              _buildTableHeader('القيمة'),
            ],
          ),
          ...rows,
        ],
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  TableRow _buildTableRow(String label, String value, Color valueColor) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: valueColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  String _formatCurrency(int amount) {
    final formatter = NumberFormat('#,###');
    return '${formatter.format(amount)} ر.س';
  }
}



