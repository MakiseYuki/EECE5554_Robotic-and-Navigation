% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 737.412736844185588 ; 739.896979306732078 ];

%-- Principal point:
cc = [ 309.500000000000000 ; 550.000000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.293462931929600 ; -0.703455798642979 ; -0.005259251442804 ; -0.000277204989756 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 1.041035940116606 ; 1.369194432235029 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.009645906816911 ; 0.061091314325251 ; 0.000608178234929 ; 0.000241547508618 ; 0.000000000000000 ];

%-- Image size:
nx = 620;
ny = 1101;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 12;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.680852e+00 ; 2.277129e+00 ; -5.135985e-01 ];
Tc_1  = [ -4.423658e+01 ; -1.047819e+02 ; 3.308038e+02 ];
omc_error_1 = [ 9.414353e-04 ; 1.184355e-03 ; 2.114860e-03 ];
Tc_error_1  = [ 3.365950e-02 ; 9.034216e-02 ; 4.871048e-01 ];

%-- Image #2:
omc_2 = [ 1.190097e+00 ; 2.045482e+00 ; -8.553772e-01 ];
Tc_2  = [ -1.648923e+01 ; -8.158889e+01 ; 3.757344e+02 ];
omc_error_2 = [ 4.455268e-04 ; 6.288367e-04 ; 9.974162e-04 ];
Tc_error_2  = [ 4.004878e-02 ; 8.809019e-02 ; 4.269277e-01 ];

%-- Image #3:
omc_3 = [ NaN ; NaN ; NaN ];
Tc_3  = [ NaN ; NaN ; NaN ];
omc_error_3 = [ NaN ; NaN ; NaN ];
Tc_error_3  = [ NaN ; NaN ; NaN ];

%-- Image #4:
omc_4 = [ 1.987346e+00 ; 1.964250e+00 ; -3.762009e-01 ];
Tc_4  = [ -8.156767e+01 ; -1.045224e+02 ; 3.140808e+02 ];
omc_error_4 = [ 1.106236e-03 ; 1.116531e-03 ; 2.030680e-03 ];
Tc_error_4  = [ 2.774253e-02 ; 8.867635e-02 ; 4.733272e-01 ];

%-- Image #5:
omc_5 = [ 2.037416e+00 ; 8.258505e-01 ; -1.439179e-01 ];
Tc_5  = [ -9.984083e+01 ; -1.433010e+00 ; 2.899568e+02 ];
omc_error_5 = [ 6.729854e-04 ; 4.439711e-04 ; 8.131467e-04 ];
Tc_error_5  = [ 2.377901e-02 ; 4.338990e-02 ; 4.577962e-01 ];

%-- Image #6:
omc_6 = [ 6.462939e-01 ; 2.576747e+00 ; -1.095039e+00 ];
Tc_6  = [ 2.369362e+01 ; -8.467880e+01 ; 4.063665e+02 ];
omc_error_6 = [ 4.331322e-04 ; 8.144863e-04 ; 1.365371e-03 ];
Tc_error_6  = [ 4.392690e-02 ; 9.634902e-02 ; 4.767403e-01 ];

%-- Image #7:
omc_7 = [ 2.166928e+00 ; 5.163746e-01 ; -2.003239e-01 ];
Tc_7  = [ -9.216051e+01 ; 1.536204e+01 ; 2.833859e+02 ];
omc_error_7 = [ 8.268010e-04 ; 3.855849e-04 ; 6.975427e-04 ];
Tc_error_7  = [ 2.300762e-02 ; 4.471011e-02 ; 4.370846e-01 ];

%-- Image #8:
omc_8 = [ 2.154706e+00 ; 1.474212e+00 ; -3.918554e-01 ];
Tc_8  = [ -1.043449e+02 ; -6.978016e+01 ; 3.348426e+02 ];
omc_error_8 = [ 1.149823e-03 ; 8.440372e-04 ; 1.378543e-03 ];
Tc_error_8  = [ 2.306340e-02 ; 7.601789e-02 ; 4.723269e-01 ];

%-- Image #9:
omc_9 = [ 2.369717e+00 ; -8.011157e-01 ; 2.690510e-01 ];
Tc_9  = [ -1.919966e+01 ; 8.034264e+01 ; 2.823911e+02 ];
omc_error_9 = [ 1.305147e-03 ; 5.661930e-04 ; 1.106462e-03 ];
Tc_error_9  = [ 4.695064e-02 ; 8.911231e-02 ; 5.051124e-01 ];

%-- Image #10:
omc_10 = [ 2.050046e+00 ; -1.337599e+00 ; 4.373694e-01 ];
Tc_10  = [ 4.727777e+01 ; 6.979385e+01 ; 2.470947e+02 ];
omc_error_10 = [ 9.134545e-04 ; 6.903184e-04 ; 1.106954e-03 ];
Tc_error_10  = [ 4.257441e-02 ; 7.637230e-02 ; 4.479820e-01 ];

%-- Image #11:
omc_11 = [ 9.252515e-01 ; 2.081517e+00 ; -1.285096e+00 ];
Tc_11  = [ -9.056589e+00 ; -4.385709e+01 ; 3.960172e+02 ];
omc_error_11 = [ 3.954211e-04 ; 5.167422e-04 ; 6.618603e-04 ];
Tc_error_11  = [ 4.073858e-02 ; 6.204302e-02 ; 4.141248e-01 ];

%-- Image #12:
omc_12 = [ 1.689310e+00 ; 2.002040e+00 ; -6.025965e-01 ];
Tc_12  = [ -5.349561e+01 ; -1.095024e+02 ; 3.539962e+02 ];
omc_error_12 = [ 8.046827e-04 ; 9.011817e-04 ; 1.477921e-03 ];
Tc_error_12  = [ 3.457736e-02 ; 1.085874e-01 ; 4.633050e-01 ];

