# Exercise 5

In this lecture we find out the relevant details of the GPUs installed on the cluster used in this lecture.

You first need to access the compute node with an interactive job. You can do this with the following command;

    # Run me!
    salloc ...
    
Once logged in, run and check the output of `deviceQuery` which is provided by the module `yyy`.

You should see something like this:

     2	Device 0: "Tesla K80"
     3	  CUDA Driver Version / Runtime Version          10.1 / 10.0
     4	  CUDA Capability Major/Minor version number:    3.7
     5	  Total amount of global memory:                 11441 MBytes (11996954624 bytes)
     6	  (13) Multiprocessors, (192) CUDA Cores/MP:     2496 CUDA Cores
     7	  GPU Max Clock rate:                            824 MHz (0.82 GHz)
     8	  Memory Clock rate:                             2505 Mhz
     9	  Memory Bus Width:                              384-bit
    10	  L2 Cache Size:                                 1572864 bytes
    11	  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65536), 3D=(4096, 4096, 4096)
    12	  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
    13	  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
    14	  Total amount of constant memory:               65536 bytes
    15	  Total amount of shared memory per block:       49152 bytes
    16	  Total number of registers available per block: 65536
    17	  Warp size:                                     32
    18	  Maximum number of threads per multiprocessor:  2048
    19	  Maximum number of threads per block:           1024
    20	  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
    21	  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
    22	  Maximum memory pitch:                          2147483647 bytes
    23	  Texture alignment:                             512 bytes
    24	  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
    25	  Run time limit on kernels:                     Yes
    26	  Integrated GPU sharing Host Memory:            No
    27	  Support host page-locked memory mapping:       Yes
    28	  Alignment requirement for Surfaces:            Yes
    29	  Device has ECC support:                        Enabled
    30	  Device supports Unified Addressing (UVA):      Yes
    31	  Device supports Compute Preemption:            No
    32	  Supports Cooperative Kernel Launch:            No
    33	  Supports MultiDevice Co-op Kernel Launch:      No
    34	  Device PCI Domain ID / Bus ID / location ID:   0 / 131 / 0
    35	  Compute Mode:
    36	     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

You can basically ignore everything from these lines except for:

* line 3, that specifies the currently loaded version of the Driver and the CUDA runtime.
* line 4, that tells you the the compute capabilities of the card;
* line 5, which reports the amount of memory per device,
* line 35 and 36: this informs us that the same device can be used by multiple processes.