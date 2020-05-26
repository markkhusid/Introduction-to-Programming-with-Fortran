program ch0513
    
    ! use the bit functions in Fortran to write out a 32 bit integer
    ! number as a sequence of zeros and ones.

    implicit none

    integer :: j
    integer :: i

    integer, parameter      :: i8  = selected_int_kind(2)
    integer, parameter      :: i16 = selected_int_kind(4)
    integer, parameter      :: i32 = selected_int_kind(9)

    integer (i8)            :: i1
    integer (i16)           :: i2
    integer (i32)           :: i3

    character (len = 32)    :: i_in_bits

    ! The original text uses print statements, but those are not cool
    ! I will use write statements where practical.
    ! Uncomment and recompile if running from the command line.
    !write   (*, '(a)', advance="no") "Type in an integer -> "
    
    ! This read statement is for run from the command line.
    ! Uncomment and recompile.
    !read    *, i
    
    ! This is for Jupyter Notebooks.
    i = 9

    i1 = int (i, kind(2))
    i2 = int (i, kind(4))
    i3 = int (i, kind(9))

    i_in_bits = ' '

    do j = 0, 7
        if (btest(i1, j)) then
            i_in_bits(8-j:8-j) = '1'
        else
            i_in_bits(8-j:8-j) = '0'
        end if
    end do

    !write (*, '(a)') "_________1_________2_________3"
    !write (*, '(a)') "12345678901234567890123456789012"

    write (*, '(i4, a)', advance="no") i1, " in binary is : "
    write (*, '(a)') i_in_bits
end program ch0513

