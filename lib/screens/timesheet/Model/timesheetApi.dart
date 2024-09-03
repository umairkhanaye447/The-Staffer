// To parse this JSON data, do
//
//     final timeSheetModel = timeSheetModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TimeSheetModel timeSheetModelFromJson(String str) => TimeSheetModel.fromJson(json.decode(str));

String timeSheetModelToJson(TimeSheetModel data) => json.encode(data.toJson());
class TimeSheetModel {
  final List<Timesheet> timesheet;

  TimeSheetModel({
    required this.timesheet,
  });

  factory TimeSheetModel.fromJson(Map<String, dynamic> json) {
    // Check if the 'timesheet' field is present and is a List
    if (json['timesheet'] != null && json['timesheet'] is List) {
      return TimeSheetModel(
        timesheet: List<Timesheet>.from(json['timesheet'].map((x) => Timesheet.fromJson(x))),
      );
    } else {
      throw const FormatException("Invalid JSON format: 'timesheet' field is missing or is not a List");
    }
  }

  Map<String, dynamic> toJson() => {
    "timesheet": List<dynamic>.from(timesheet.map((x) => x.toJson())),
  };
}
class Timesheet {
    final int id;
    final int parentId;
    final int employeeJobId;
    final int customerId;
    final dynamic departmentId;
    final int employeeId;
    final DateTime hoursForWeek;
    final String regularHours;
    final String overtimeHours;
    final dynamic createdAt;
    final DateTime updatedAt;
    final int invoiceId;
    final int payrollStatus;
    final dynamic ckDate;
    final String timesheetType;
    final dynamic backupDepartmentId;
    final String customerName;
    final double payRate;
    final int overRate;
    final String jobPosition;

    Timesheet({
        required this.id,
        required this.parentId,
        required this.employeeJobId,
        required this.customerId,
        required this.departmentId,
        required this.employeeId,
        required this.hoursForWeek,
        required this.regularHours,
        required this.overtimeHours,
        required this.createdAt,
        required this.updatedAt,
        required this.invoiceId,
        required this.payrollStatus,
        required this.ckDate,
        required this.timesheetType,
        required this.backupDepartmentId,
        required this.customerName,
        required this.payRate,
        required this.overRate,
        required this.jobPosition,
    });

    Timesheet copyWith({
        int? id,
        int? parentId,
        int? employeeJobId,
        int? customerId,
        dynamic departmentId,
        int? employeeId,
        DateTime? hoursForWeek,
        String? regularHours,
        String? overtimeHours,
        dynamic createdAt,
        DateTime? updatedAt,
        int? invoiceId,
        int? payrollStatus,
        dynamic ckDate,
        String? timesheetType,
        dynamic backupDepartmentId,
        String? customerName,
        double? payRate,
        int? overRate,
        String? jobPosition,
    }) => 
        Timesheet(
            id: id ?? this.id,
            parentId: parentId ?? this.parentId,
            employeeJobId: employeeJobId ?? this.employeeJobId,
            customerId: customerId ?? this.customerId,
            departmentId: departmentId ?? this.departmentId,
            employeeId: employeeId ?? this.employeeId,
            hoursForWeek: hoursForWeek ?? this.hoursForWeek,
            regularHours: regularHours ?? this.regularHours,
            overtimeHours: overtimeHours ?? this.overtimeHours,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            invoiceId: invoiceId ?? this.invoiceId,
            payrollStatus: payrollStatus ?? this.payrollStatus,
            ckDate: ckDate ?? this.ckDate,
            timesheetType: timesheetType ?? this.timesheetType,
            backupDepartmentId: backupDepartmentId ?? this.backupDepartmentId,
            customerName: customerName ?? this.customerName,
            payRate: payRate ?? this.payRate,
            overRate: overRate ?? this.overRate,
            jobPosition: jobPosition ?? this.jobPosition,
        );

    factory Timesheet.fromJson(Map<String, dynamic> json) => Timesheet(
        id: json["id"]??0,
        parentId: json["parent_id"]??0,
        employeeJobId: json["employee_job_id"]??0,
        customerId: json["customer_id"]??0,
        departmentId: json["department_id"]??'',
        employeeId: json["employee_id"]??0,
        hoursForWeek: DateTime.parse(json["hours_for_week"]),
        regularHours: json["regular_hours"]??'',
        overtimeHours: json["overtime_hours"]??'',
        createdAt: json["created_at"]??'',
        updatedAt: DateTime.parse(json["updated_at"]),
        invoiceId: json["invoice_id"]??0,
        payrollStatus: json["payroll_status"]??0,
        ckDate: json["ck_date"]??'',
        timesheetType: json["timesheet_type"]??'',
        backupDepartmentId: json["backup_department_id"]??'',
        customerName: json["customer_name"]??'',
        payRate: json["pay_rate"]?.toDouble()??0.0,
        overRate: json["over_rate"]??0,
        jobPosition: json["job_position"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "employee_job_id": employeeJobId,
        "customer_id": customerId,
        "department_id": departmentId,
        "employee_id": employeeId,
        "hours_for_week": "${hoursForWeek.year.toString().padLeft(4, '0')}-${hoursForWeek.month.toString().padLeft(2, '0')}-${hoursForWeek.day.toString().padLeft(2, '0')}",
        "regular_hours": regularHours,
        "overtime_hours": overtimeHours,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "invoice_id": invoiceId,
        "payroll_status": payrollStatus,
        "ck_date": ckDate,
        "timesheet_type": timesheetType,
        "backup_department_id": backupDepartmentId,
        "customer_name": customerName,
        "pay_rate": payRate,
        "over_rate": overRate,
        "job_position": jobPosition,
    };
}
