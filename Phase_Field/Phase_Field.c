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

void next_phi(double ***data, double time) {
  int i, j, k;
  double time;
  double X, Y; // x and y length

  for (i = 0; i < t_step; i++) {
    for (j = 0; j < count; i++) {
      /* code */
    }
  }

  data[t_step + 1]
}

int main(void) {

  /*変数&物理量設定*/
  int i, j, k;

  double nx, ny; // x and y grid
  double h;      // computational grid [m]
  double t_step; // time step
  double dt;     // time of one step [s]

  double DF;    // driving force of solid phase: f_L-f_S [J/m^3]
  double gamma; // interfacial energy [J/m^2]
  double tau;   // positive constant

  /*配列確保*/
  double ***phi = (double ***)malloc(sizeof(double **) * t_step); // order parameter
  for (i = 0; i < t_step; i++) {
    phi[i] = (double **)malloc(sizeof(double *) * nx);
    for (j = 0; j < nx; j++) {
      phi[i][j] = (double *)malloc(sizeof(double) * ny);
    }
  }

  for (i = 0; i < t_step; i++) {
    for (j = 0; j < nx; j++) {
      free(phi[i][j]);
    }
    free(phi[i]);
  }

  free(phi);

  printf("Hello, World");
  return 0;
}