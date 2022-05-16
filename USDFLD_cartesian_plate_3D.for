C     ABAQUS Subroutine for functionally graded material (FGM) in a cartesian coordinate system 2D
C			
C
C     More Infos can be found at 
C     https://classes.engineering.wustl.edu/2009/spring/mase5513/abaqus/docs/v6.6/books/sub/default.htm?startat=ch01s01asb40.html#sub-xsl-usdfld
C
C     by Dr. Ronald Wagner - University Braunschweig, Germany, ro.wagner@tu-braunschweig.de

C---------------------------------------------------------------------------------------

C Start of Base code, DO NOT change

C---------------------------------------------------------------------------------------
      SUBROUTINE USDFLD(FIELD,STATEV,PNEWDT,DIRECT,T,CELENT,TIME,DTIME,CMNAME,ORNAME,NFIELD,NSTATV,NOEL,NPT,LAYER,KSPT,KSTEP,KINC,NDI,NSHR,COORD,JMAC,JMATYP,MATLAYO,LACCFLA)
C
      INCLUDE 'ABA_PARAM.INC'
C
      CHARACTER*80 CMNAME,ORNAME
      CHARACTER*3  FLGRAY(15)
      DIMENSION FIELD(NFIELD),STATEV(NSTATV),DIRECT(3,3),T(3,3),TIME(2)
      DIMENSION ARRAY(15),JARRAY(15),JMAC(*),JMATYP(*),COORD(*)
C---------------------------------------------------------------------------------------

C End of Base code

C---------------------------------------------------------------------------------------
C---------------------------------------------------------------------------------------

C Start of USER code

C---------------------------------------------------------------------------------------

c       read x, y, z coordinate
        x = COORD(1)
        y = COORD(2)
        z = COORD(3)
c       calculate Young module
        E = x
c       define depend state variable (E(z))
        FIELD(1) = E
c       save E value for state dependend variable

        STATEV(1) = 70000 +(380000-70000)*(0.5+E/2)**3
C---------------------------------------------------------------------------------------

C End of USER code

C---------------------------------------------------------------------------------------

      RETURN
      END
