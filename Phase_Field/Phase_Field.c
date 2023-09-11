#define _USE_MATH_DEFINES // for C
#include <math.h>
#include <stdio.h>

void Initialize_double(int NX, int NY, double **data, double a) { // data , initial value
  int i, j;

  for (i = 0; i < NX; i++) {
    for (j = 0; j < NY; j++) {
      data[i][j] = a;
    }
  }
}

int main(void) {

  /*変数&物理量設定*/
  int i, j, k;

  int NX, NY;    // x and y length
  double dx, xy; // calculate space [m]
  int t_step;    // time step
  double dt;     // time of one step [s]

  double DF;    // driving force of solid phase: f_L-f_S [J/m^3]
  double gamma; // interfacial energy [J/m^2]
  double tau;   // positive constant

  /*配列確保*/
  double ***phi = (double ***)malloc(sizeof(double **) * t_step); // order parameter
  for (i = 0; i < t_step; i++) {
    phi[i] = (double **)malloc(sizeof(double *) * NX);
    for (j = 0; j < NX; j++) {
      phi[i][j] = (double *)malloc(sizeof(double) * NY);
    }
  }

  printf("Hello, World");
  return 0;
}