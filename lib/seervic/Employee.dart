class Employee {
  int? id;
  String? employee_name;
  int? employee_salary;
  String? employee_image;
  int? employee_age;

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employee_name = json['employee_name'];
    employee_salary = json['employee_salary'];
    employee_image = json['employee_image'];
    employee_age = json['employee_age'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'employee_name': employee_name,
        'employee_salary': employee_salary,
        'employee_image': employee_image,
        'employee_age': employee_age,
      };
}
