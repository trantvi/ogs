AddTest(
        NAME 2D_RichardsFlow_h_us_quad_ogs5
        PATH Parabolic/Richards
        EXECUTABLE ogs
        EXECUTABLE_ARGS RichardsFlow_2d_compare_ogs5.prj
        TESTER vtkdiff
        DIFF_DATA
        h_us_quad_1000.vtu richards_pcs_0_ts_100_t_100.000000.vtu PRESSURE1 pressure 1e-1 1e-1
    REQUIREMENTS NOT OGS_USE_MPI
)
AddTest(
        NAME 2D_RichardsFlow_h_us_quad_small
        PATH Parabolic/Richards
        EXECUTABLE ogs
        EXECUTABLE_ARGS RichardsFlow_2d_small.prj
        TESTER vtkdiff
        DIFF_DATA
        ref_t_1600.000000.vtu richards_pcs_0_ts_1100_t_1600.000000.vtu pressure pressure 1e-8 1e-8
    REQUIREMENTS NOT OGS_USE_MPI
)
AddTest(
        NAME LARGE_2D_RichardsFlow_h_us_quad
        PATH Parabolic/Richards
        EXECUTABLE ogs
        EXECUTABLE_ARGS RichardsFlow_2d_large.prj
        TESTER vtkdiff
        DIFF_DATA
        ref_t_20000.000000.vtu richards_pcs_0_ts_18200_t_20000.000000.vtu pressure pressure 1e-8 1e-8
    REQUIREMENTS NOT OGS_USE_MPI
)

AddTest(
    NAME 2D_RichardsFlow_h_us_quad_small_Adaptive_dt
    PATH Parabolic/Richards
    EXECUTABLE ogs
    EXECUTABLE_ARGS RichardsFlow_2d_small_adaptive_dt.prj
    TESTER vtkdiff
    DIFF_DATA
    ref_t_1600.000000.vtu richards_pcs_0_ts_803_t_1600.000000.vtu pressure pressure 1e-8 1e-3
    REQUIREMENTS NOT OGS_USE_MPI
)

#PETSc/MPI
AddTest(
    NAME 2D_RichardsFlow_h_us_quad_small_Adaptive_dt
    PATH Parabolic/Richards
    EXECUTABLE_ARGS RichardsFlow_2d_small_adaptive_dt.prj
    WRAPPER mpirun
    WRAPPER_ARGS -np 1
    TESTER vtkdiff
    REQUIREMENTS OGS_USE_MPI
    DIFF_DATA
    ref_t_1600.000000.vtu richards_pcs_0_ts_803_t_1600_000000_0.vtu pressure pressure 1e-8 1e-3
)
