// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    final List<Datum> data;

    HomeModel({
        required this.data,
    });

    HomeModel copyWith({
        List<Datum>? data,
    }) => 
        HomeModel(
            data: data ?? this.data,
        );

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}
class Datum {
    final String totalWeeklyHours;
    final String prevWeeklyHours;
    final String empName;
    final String profilePic;
    final List<Assignment> assignments;
    final int earnings;
    final int prevEarnings;
    final int pending;
    final int shifts;
    final String startDate;
    final DateTime? endDate;
    final String prevWeekStart;
    final String prevWeekEnd;
    final String currentDateFormat;
    final String currencyformat;

    Datum({
        required this.totalWeeklyHours,
        required this.prevWeeklyHours,
        required this.empName,
        required this.profilePic,
        required this.assignments,
        required this.earnings,
        required this.prevEarnings,
        required this.pending,
        required this.shifts,
        required this.startDate,
        this.endDate,
        required this.prevWeekStart,
        required this.prevWeekEnd,
        required this.currentDateFormat,
        required this.currencyformat,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        totalWeeklyHours: json["total_weekly_hours"] ?? '',
        prevWeeklyHours: json["prev_weekly_hours"] ?? '',
        empName: json["emp_name"] ?? '',
        profilePic: json["profile_pic"] ?? '',
        assignments: List<Assignment>.from(
            json["assignments"]?.map((x) => Assignment.fromJson(x)) ?? []),
        earnings: json["earnings"] ?? 0,
        prevEarnings: json["prev_earnings"] ?? 0,
        pending: json["pending"] ?? 0,
        shifts: json["shifts"] ?? 0,
        startDate: json["start_date"] ?? '',
        endDate: json["end_date"] != null 
            ? DateTime.tryParse(json["end_date"]) 
            : null,
        prevWeekStart: json["prev_week_start"] ?? '',
        prevWeekEnd: json["prev_week_end"] ?? '',
        currentDateFormat: json["current_date_format"] ?? '',
        currencyformat: json["currencyformat"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "total_weekly_hours": totalWeeklyHours,
        "prev_weekly_hours": prevWeeklyHours,
        "emp_name": empName,
        "profile_pic": profilePic,
        "assignments": List<dynamic>.from(assignments.map((x) => x.toJson())),
        "earnings": earnings,
        "prev_earnings": prevEarnings,
        "pending": pending,
        "shifts": shifts,
        "start_date": startDate,
        "end_date": endDate != null ? endDate!.toIso8601String() : null,
        "prev_week_start": prevWeekStart,
        "prev_week_end": prevWeekEnd,
        "current_date_format": currentDateFormat,
        "currencyformat": currencyformat,
    };
}
class Assignment {
    final int number;
    final int id;
    final int jobId;
    final int employeeId;
    final int employeePaySetupId;
    final String employment;
    final String payRate;
    final String overtimePayRate;
    final String status;
    final String agencyMargin;
    final String customerPayRate;
    final String customerOvertimePayRate;
    final String endDate;
    final DateTime? startDate;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int createdBy;
    final int employeeJobId;
    final String jobTitle;
    final String employeeName;
    final int customer;
    final String customerName;

    Assignment({
        required this.number,
        required this.id,
        required this.jobId,
        required this.employeeId,
        required this.employeePaySetupId,
        required this.employment,
        required this.payRate,
        required this.overtimePayRate,
        required this.status,
        required this.agencyMargin,
        required this.customerPayRate,
        required this.customerOvertimePayRate,
        required this.endDate,
        this.startDate,
        this.createdAt,
        this.updatedAt,
        required this.createdBy,
        required this.employeeJobId,
        required this.jobTitle,
        required this.employeeName,
        required this.customer,
        required this.customerName,
    });

    factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        number: json["number"] ?? 0,
        id: json["id"] ?? 0,
        jobId: json["job_id"] ?? 0,
        employeeId: json["employee_id"] ?? 0,
        employeePaySetupId: json["employee_pay_setup_id"] ?? 0,
        employment: json["employment"] ?? '',
        payRate: json["pay_rate"] ?? '',
        overtimePayRate: json["overtime_pay_rate"] ?? '',
        status: json["status"] ?? '',
        agencyMargin: json["agency_margin"] ?? '',
        customerPayRate: json["customer_pay_rate"] ?? '',
        customerOvertimePayRate: json["customer_overtime_pay_rate"] ?? '',
        endDate: json["end_date"] ?? '',
        startDate: json["start_date"] != null
            ? DateTime.tryParse(json["start_date"])
            : null,
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
        createdBy: json["created_by"] ?? 0,
        employeeJobId: json["employee_job_id"] ?? 0,
        jobTitle: json["job_title"] ?? '',
        employeeName: json["employee_name"] ?? '',
        customer: json["customer"] ?? 0,
        customerName: json["customer_name"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "id": id,
        "job_id": jobId,
        "employee_id": employeeId,
        "employee_pay_setup_id": employeePaySetupId,
        "employment": employment,
        "pay_rate": payRate,
        "overtime_pay_rate": overtimePayRate,
        "status": status,
        "agency_margin": agencyMargin,
        "customer_pay_rate": customerPayRate,
        "customer_overtime_pay_rate": customerOvertimePayRate,
        "end_date": endDate,
        "start_date": startDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_by": createdBy,
        "employee_job_id": employeeJobId,
        "job_title": jobTitle,
        "employee_name": employeeName,
        "customer": customer,
        "customer_name": customerName,
    };
}
