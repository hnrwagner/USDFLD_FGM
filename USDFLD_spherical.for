C     ABAQUS Subroutine for functionally graded material (FGM) in a spherical coordinate system 
C			
C
C     More Infos can be found at 
C     https://classes.engineering.wustl.edu/2009/spring/mase5513/abaqus/docs/v6.6/books/sub/default.htm?startat=ch01s01asb40.html#sub-xsl-usdfld
C
C     by Dr. Ronald Wagner - University Braunschweig, Germany, ro.wagner@tu-braunschweig.de

C---------------------------------------------------------------------------------------

C Start of Base code, DO NOT change

C---------------------------------------------------------------------------------------
      SUBROUTINE USDFLD(FIELD,STATEV,PNEWDT,DIRECT,T,CELENT,
     1 TIME,DTIME,CMNAME,ORNAME,NFIELD,NSTATV,NOEL,NPT,LAYER,
     2 KSPT,KSTEP,KINC,NDI,NSHR,COORD,JMAC,JMATYP,MATLAYO,LACCFLA)
     
C         
	 INCLUDE 'ABA_PARAM.INC'
C
	 CHARACTER*80 CMNAME,ORNAME
	 CHARACTER*3 FLGRAY(15)
	 DIMENSION FIELD(NFIELD),STATEV(NSTATV),DIRECT(3,3),T(3,3),TIME(2)
	 DIMENSION ARRAY(15),JARRAY(15),JMAC(*),JMATYP(*),COORD(*)
C---------------------------------------------------------------------------------------

C End of Base code

C---------------------------------------------------------------------------------------
C---------------------------------------------------------------------------------------

C Start of USER code

C---------------------------------------------------------------------------------------

c       center of coordinate system
        x0 = 0.d0
        y0 = 0.d0
        z0 = 0.d0
c       read x, y, z coordinate
        x = COORD(1)
        y = COORD(2)
        z = COORD(3)
c       calculate Young module
        E = sqrt((x-x0)**2 + (y-y0)**2 + (z-z0)**2)
c       define depend state variable (E(x,y))
        FIELD(1) = E
c       save E value for state dependend variable
        STATEV(1) = 1400*E+70000

C---------------------------------------------------------------------------------------

C End of USER code

C---------------------------------------------------------------------------------------

      RETURN
      END
