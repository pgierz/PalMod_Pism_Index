# Dummy script generated by esm-tools, to be removed later: 
module purge
module load pism_externals
module load cmake
module load udunits
module load gribapi/1.28.0
module unload intel.compiler
module load intel.compiler
module unload netcdf
module load hdf5
module load centoslibs cdo nco netcdf/4.6.2_intel
module load python3
module list
module unload intel.mpi
module load intel.mpi

export HDF5ROOT=$HDF5_ROOT
export NETCDFFROOT=$NETCDF_DIR
export NETCDFROOT=$NETCDF_DIR
export NETCDF_Fortran_INCLUDE_DIRECTORIES=$NETCDFROOT/include
export NETCDF_CXX_INCLUDE_DIRECTORIES=$NETCDFROOT/include
export NETCDF_CXX_LIBRARIES=$NETCDFROOT/lib
export PERL5LIB=/usr/lib64/perl5
export LAPACK_LIB="-lmkl_intel_lp64 -lmkl_core -mkl=sequential -lpthread -lm -ldl"
export LAPACK_LIB_DEFAULT="-L/global/AWIsoft/intel/2018/compilers_and_libraries_2018.5.274/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_core -lmkl_sequential"
export XML2ROOT=/usr
export ZLIBROOT=/usr
export FC="mpiifort -mkl"
export F77="mpiifort -mkl"
export MPIFC=mpiifort
export MPICC=mpiicc
export CC=mpiicc
export CXX=mpiicpc
export MPIROOT=$(mpiifort -show | perl -lne 'm{ -I(.*?)/include } and print $1')
export MPI_LIB=$(mpiifort -show |sed -e 's/^[^ ]*//' -e 's/-[I][^ ]*//g')
export I_MPI_FABRICS=shm:tmi
export PATH=/work/ollie/jhegewal/sw/cmake/bin:$PATH
export MPIROOT=${I_MPI_ROOT}/intel64
export ENVIRONMENT_SET_BY_ESMTOOLS=TRUE

cd pism-index1.1
mkdir -p build; cd build; export PISM_INSTALL_PREFIX=$(readlink -f $(pwd)/..); cmake \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DPism_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_CXX_COMPILER=$CXX \
        -DCMAKE_CXX_FLAGS="-std=c++11 -fp-model precise -no-fast-transcendentals" \
        -DCMAKE_C_COMPILER=$CC  \
        -DCMAKE_C_FLAGS="-fp-model precise -no-fast-transcendentals" \
        -DPETSC_EXECUTABLE_RUNS:BOOL=ON \
        -DMPI_C_DIR="$I_MPI_ROOT" \
        -DPism_USE_JANSSON:BOOL=NO \
        -DPism_USE_PARALLEL_NETCDF4:BOOL=OFF \
        -DPism_USE_PARALLEL_HDF5:BOOL=OFF \
        -DPism_USE_PROJ4:BOOL=YES \
        -DPism_BUILD_EXTRA_EXECS:BOOL=ON \
        ..; make -j4; make install;

cd ..
