import 'dart:io';
void main() {
  
  stdout.write("Inputkan Angka : ");
  int n = int.parse(stdin.readLineSync().toString());

  for(int i=1; i<=n; i++) {
    for(int j=1; j<=i; j++) {
      if(j>=i) {
        stdout.write(' $j ');
      }else {
        stdout.write(' $j ');
      }
    }
    for(int j=i*2; j<n*2-1; j++){
      stdout.write('   ');
    }
    for (int k=n-1; k>=1; k--) {
      if (k<=i) {
        stdout.write(' $k ');
      }else {
        stdout.write('');
      }
    }
    print('');
  }
  for(int i=n-1; i>=1; i--) {
    for(int j=1; j<=i; j++) {
      if(j<=i) {
        stdout.write(' $j ');
      }else {
        stdout.write(' $j');
      }
    }
    for(int j=i*2; j<n*2-1; j++){
      stdout.write('   ');
    }
    for (int k=n-1; k>=1; k--) {
      if (k<=i) {
        stdout.write(' $k ');
      }else {
        stdout.write('');
      }
    }
    print('');
  }
}