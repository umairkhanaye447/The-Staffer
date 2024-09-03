// To parse this JSON data, do
//     final assignmentModel = assignmentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AssignmentModel assignmentModelFromJson(String str) =>
    AssignmentModel.fromJson(json.decode(str));

String assignmentModelToJson(AssignmentModel data) =>
    json.encode(data.toJson());

class AssignmentModel {
  final List<Datum> data;

  AssignmentModel({
    required this.data,
  });

  AssignmentModel copyWith({
    List<Datum>? data,
  }) =>
      AssignmentModel(
        data: data ?? this.data,
      );

  factory AssignmentModel.fromJson(Map<String, dynamic> json) =>
      AssignmentModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String? epsEmployment;
  final String? payType;
  final String? payMethod;
  final int? vendorId;
  final int? epsId;
  final int employeePaySetupId;
  final DateTime startDate;
  final String endDate;
  final int empJobId;
  final int jobId;
  final int employeeId;
  final String empStatus;
  final String jobEndDate;
  final int createdBy;
  final String customer;
  final int customerIdVal;
  final String jobPosition;
  final String employee;
  final String department;
  final String? payroll;
  final String? vendorDeletedDate;
  final String branch;
  final User user;

  Datum({
    this.epsEmployment,
    this.payType,
    this.payMethod,
    this.vendorId,
    this.epsId,
    required this.employeePaySetupId,
    required this.startDate,
    required this.endDate,
    required this.empJobId,
    required this.jobId,
    required this.employeeId,
    required this.empStatus,
    required this.jobEndDate,
    required this.createdBy,
    required this.customer,
    required this.customerIdVal,
    required this.jobPosition,
    required this.employee,
    required this.department,
    this.payroll,
    this.vendorDeletedDate,
    required this.branch,
    required this.user,
  });

  Datum copyWith({
    String? epsEmployment,
    String? payType,
    String? payMethod,
    int? vendorId,
    int? epsId,
    int? employeePaySetupId,
    DateTime? startDate,
    String? endDate,
    int? empJobId,
    int? jobId,
    int? employeeId,
    String? empStatus,
    String? jobEndDate,
    int? createdBy,
    String? customer,
    int? customerIdVal,
    String? jobPosition,
    String? employee,
    String? department,
    String? payroll,
    String? vendorDeletedDate,
    String? branch,
    User? user,
  }) =>
      Datum(
        epsEmployment: epsEmployment ?? this.epsEmployment,
        payType: payType ?? this.payType,
        payMethod: payMethod ?? this.payMethod,
        vendorId: vendorId ?? this.vendorId,
        epsId: epsId ?? this.epsId,
        employeePaySetupId: employeePaySetupId ?? this.employeePaySetupId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        empJobId: empJobId ?? this.empJobId,
        jobId: jobId ?? this.jobId,
        employeeId: employeeId ?? this.employeeId,
        empStatus: empStatus ?? this.empStatus,
        jobEndDate: jobEndDate ?? this.jobEndDate,
        createdBy: createdBy ?? this.createdBy,
        customer: customer ?? this.customer,
        customerIdVal: customerIdVal ?? this.customerIdVal,
        jobPosition: jobPosition ?? this.jobPosition,
        employee: employee ?? this.employee,
        department: department ?? this.department,
        payroll: payroll ?? this.payroll,
        vendorDeletedDate: vendorDeletedDate ?? this.vendorDeletedDate,
        branch: branch ?? this.branch,
        user: user ?? this.user,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        epsEmployment: json["eps_employment"] ?? '',
        payType: json["pay_type"] ?? '',
        payMethod: json["pay_method"] ?? '',
        vendorId: json["vendor_id"] ?? 0,
        epsId: json["eps_id"] ?? 0,
        employeePaySetupId: json["employee_pay_setup_id"] ?? 0,
        startDate: DateTime.parse(json["start_date"]),
        endDate: json["end_date"] ?? '',
        empJobId: json["emp_job_id"] ?? 0,
        jobId: json["job_id"] ?? 0,
        employeeId: json["employee_id"] ?? 0,
        empStatus: json["emp_status"] ?? '',
        jobEndDate: json["job_end_date"] ?? '',
        createdBy: json["created_by"] ?? 0,
        customer: json["customer"] ?? '',
        customerIdVal: json["customer_id_val"] ?? 0,
        jobPosition: json["job_position"] ?? '',
        employee: json["employee"] ?? '',
        department: json["department"] ?? '',
        payroll: json["payroll"] ?? '',
        vendorDeletedDate: json["vendor_deleted_date"] ?? '',
        branch: json["branch"] ?? '',
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "eps_employment": epsEmployment,
        "pay_type": payType,
        "pay_method": payMethod,
        "vendor_id": vendorId,
        "eps_id": epsId,
        "employee_pay_setup_id": employeePaySetupId,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate,
        "emp_job_id": empJobId,
        "job_id": jobId,
        "employee_id": employeeId,
        "emp_status": empStatus,
        "job_end_date": jobEndDate,
        "created_by": createdBy,
        "customer": customer,
        "customer_id_val": customerIdVal,
        "job_position": jobPosition,
        "employee": employee,
        "department": department,
        "payroll": payroll,
        "vendor_deleted_date": vendorDeletedDate,
        "branch": branch,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final int organizationId;
  final dynamic groupId;
  final String firstName;
  final String lastName;
  final int roleId;
  final String name;
  final int branchId;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String streetAddress;
  final String city;
  final String state;
  final String zipcode;
  final String country;
  final String phone;
  final String fax;
  final String website;
  final String taxIdNumber;
  final String logo;
  final String contactName;
  final String contactDesignation;
  final String contactEmail;
  final dynamic customerId;
  final dynamic employeeId;
  final String imagePath;
  final dynamic timeZone;

  User({
    required this.id,
    required this.organizationId,
    required this.groupId,
    required this.firstName,
    required this.lastName,
    required this.roleId,
    required this.name,
    required this.branchId,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.phone,
    required this.fax,
    required this.website,
    required this.taxIdNumber,
    required this.logo,
    required this.contactName,
    required this.contactDesignation,
    required this.contactEmail,
    required this.customerId,
    required this.employeeId,
    required this.imagePath,
    required this.timeZone,
  });

  User copyWith({
    int? id,
    int? organizationId,
    dynamic groupId,
    String? firstName,
    String? lastName,
    int? roleId,
    String? name,
    int? branchId,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? streetAddress,
    String? city,
    String? state,
    String? zipcode,
    String? country,
    String? phone,
    String? fax,
    String? website,
    String? taxIdNumber,
    String? logo,
    String? contactName,
    String? contactDesignation,
    String? contactEmail,
    dynamic customerId,
    dynamic employeeId,
    String? imagePath,
    dynamic timeZone,
  }) =>
      User(
        id: id ?? this.id,
        organizationId: organizationId ?? this.organizationId,
        groupId: groupId ?? this.groupId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        roleId: roleId ?? this.roleId,
        name: name ?? this.name,
        branchId: branchId ?? this.branchId,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        streetAddress: streetAddress ?? this.streetAddress,
        city: city ?? this.city,
        state: state ?? this.state,
        zipcode: zipcode ?? this.zipcode,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        fax: fax ?? this.fax,
        website: website ?? this.website,
        taxIdNumber: taxIdNumber ?? this.taxIdNumber,
        logo: logo ?? this.logo,
        contactName: contactName ?? this.contactName,
        contactDesignation: contactDesignation ?? this.contactDesignation,
        contactEmail: contactEmail ?? this.contactEmail,
        customerId: customerId ?? this.customerId,
        employeeId: employeeId ?? this.employeeId,
        imagePath: imagePath ?? this.imagePath,
        timeZone: timeZone ?? this.timeZone,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        organizationId: json["organization_id"] ?? 0,
        groupId: json["group_id"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        roleId: json["role_id"] ?? '',
        name: json["name"] ?? '',
        branchId: json["branch_id"] ?? 0,
        email: json["email"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        streetAddress: json["street_address"] ?? '',
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        zipcode: json["zipcode"] ?? '',
        country: json["country"] ?? '',
        phone: json["phone"] ?? '',
        fax: json["fax"] ?? '',
        website: json["website"] ?? '',
        taxIdNumber: json["tax_id_number"] ?? '',
        logo: json["logo"] ?? '',
        contactName: json["contact_name"] ?? '',
        contactDesignation: json["contact_designation"] ?? '',
        contactEmail: json["contact_email"] ?? '',
        customerId: json["customer_id"] ?? '',
        employeeId: json["employee_id"] ?? '',
        imagePath: json["image_path"] ?? '',
        timeZone: json["time_zone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "organization_id": organizationId,
        "group_id": groupId,
        "first_name": firstName,
        "last_name": lastName,
        "role_id": roleId,
        "name": name,
        "branch_id": branchId,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "street_address": streetAddress,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "phone": phone,
        "fax": fax,
        "website": website,
        "tax_id_number": taxIdNumber,
        "logo": logo,
        "contact_name": contactName,
        "contact_designation": contactDesignation,
        "contact_email": contactEmail,
        "customer_id": customerId,
        "employee_id": employeeId,
        "image_path": imagePath,
        "time_zone": timeZone,
      };
}
