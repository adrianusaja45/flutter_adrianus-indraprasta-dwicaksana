import 'dart:io';

class Course {
  var judul = '';
  var deskripsi = '';
}

class Student {
  var nama = '';
  var kelas = '';
  List<Course> courseList = [];

  void add(Course course) {
    courseList.add(course);
    print('Course Added');
  }

  void remove(int i) {
    courseList.removeAt(i);
    for (int i = 0; i < courseList.length; i++) {
      print('Judul Course');
      print(courseList[i].judul);
      print(courseList[i].deskripsi);
    }
  }

  void viewCourses() {
    for (int i = 0; i < courseList.length; i++) {
      print('Judul Course');
      print(courseList[i].judul);
      print(courseList[i].deskripsi);
    }
  }
}

void main() {
  var course = Course();
  var stud = Student();

  stud.nama = 'Bobby';
  stud.kelas = '6-A';

  var nama = stud.nama;
  var kelas = stud.kelas;

  print('Halo $nama dari $kelas');

  print('Masukkan Judul Course');
  course.judul = stdin.readLineSync()!;
  print('Masukkan Judul Deskripsi');
  course.deskripsi = stdin.readLineSync()!;

//add course

  stud.add(course);

  //remove course
  print('Pilih course mana yang ingin dihapus');
  stud.remove(int.parse(stdin.readLineSync()!));

// view course list
  stud.viewCourses();
}
