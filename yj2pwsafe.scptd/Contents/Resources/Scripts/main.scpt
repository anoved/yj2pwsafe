FasdUAS 1.101.10   ��   ��    k             i         I     ������
�� .aevtoappnull  �   � ****��  ��    O     � 	 
 	 k    �       l   ��������  ��  ��        l    ��  ��    V P
		Input: Password item files
		(.txt files presumably exported from Yojimbo.)
	     �   � 
 	 	 I n p u t :   P a s s w o r d   i t e m   f i l e s 
 	 	 ( . t x t   f i l e s   p r e s u m a b l y   e x p o r t e d   f r o m   Y o j i m b o . ) 
 	      r        l    ����  I   ���� 
�� .sysostdfalis    ��� null��    ��  
�� 
prmp  m       �   > S e l e c t   e x p o r t e d   p a s s w o r d   f i l e s :  �� ��
�� 
mlsl  m    	��
�� boovtrue��  ��  ��    o      ���� 0 _pwfiles        l   ��������  ��  ��       !   l    �� " #��   "60
		Input: Password database
		Name the database to which the passwords should be added.
		(Specifying an existing filename will prompt a replace file warning;
		technically true, although the existing database will be loaded first,
		and the new file will include original contents as well as the new.)
	    # � $ $` 
 	 	 I n p u t :   P a s s w o r d   d a t a b a s e 
 	 	 N a m e   t h e   d a t a b a s e   t o   w h i c h   t h e   p a s s w o r d s   s h o u l d   b e   a d d e d . 
 	 	 ( S p e c i f y i n g   a n   e x i s t i n g   f i l e n a m e   w i l l   p r o m p t   a   r e p l a c e   f i l e   w a r n i n g ; 
 	 	 t e c h n i c a l l y   t r u e ,   a l t h o u g h   t h e   e x i s t i n g   d a t a b a s e   w i l l   b e   l o a d e d   f i r s t , 
 	 	 a n d   t h e   n e w   f i l e   w i l l   i n c l u d e   o r i g i n a l   c o n t e n t s   a s   w e l l   a s   t h e   n e w . ) 
 	 !  % & % r     ' ( ' l    )���� ) I   ���� *
�� .sysonwflfile    ��� null��   * �� + ,
�� 
prmt + m     - - � . . $ P a s s w o r d   d a t a b a s e : , �� /��
�� 
dfnm / m     0 0 � 1 1   p a s s w o r d s . p s a f e 3��  ��  ��   ( o      ���� 0 _dbfile   &  2 3 2 r    ! 4 5 4 n     6 7 6 1    ��
�� 
psxp 7 o    ���� 0 _dbfile   5 o      ���� 0 _dbpath   3  8 9 8 l  " "��������  ��  ��   9  : ; : l   " "�� < =��   < * $
		Input: Database master password
	    = � > > H 
 	 	 I n p u t :   D a t a b a s e   m a s t e r   p a s s w o r d 
 	 ;  ? @ ? r   " E A B A n   " A C D C 1   = A��
�� 
ttxt D l  " = E���� E I  " =�� F G
�� .sysodlogaskr        TEXT F b   " ' H I H b   " % J K J m   " # L L � M M  P a s s w o r d   f o r   K o   # $���� 0 _dbpath   I m   % & N N � O O  : G �� P Q
�� 
dtxt P m   * - R R � S S   Q �� T U
�� 
appr T m   0 3 V V � W W 0 D a t a b a s e   M a s t e r   P a s s w o r d U �� X��
�� 
htxt X m   6 7��
�� boovtrue��  ��  ��   B o      ���� 	0 _dbpw   @  Y Z Y l  F F��������  ��  ��   Z  [ \ [ l   F F�� ] ^��   ] � �
		Assemble the command.
		First, find the contained Tcl script that does the actual work.
		As its first argument, append the path to the password database file.
		Lastly, append the path to each selected password file.
	    ^ � _ _� 
 	 	 A s s e m b l e   t h e   c o m m a n d . 
 	 	 F i r s t ,   f i n d   t h e   c o n t a i n e d   T c l   s c r i p t   t h a t   d o e s   t h e   a c t u a l   w o r k . 
 	 	 A s   i t s   f i r s t   a r g u m e n t ,   a p p e n d   t h e   p a t h   t o   t h e   p a s s w o r d   d a t a b a s e   f i l e . 
 	 	 L a s t l y ,   a p p e n d   t h e   p a t h   t o   e a c h   s e l e c t e d   p a s s w o r d   f i l e . 
 	 \  ` a ` r   F Y b c b n   F U d e d 1   S U��
�� 
psxp e l  F S f���� f I  F S�� g h
�� .sysorpthalis        TEXT g m   F I i i � j j  y j 2 p w s a f e . t c l h �� k��
�� 
in D k m   L O l l � m m  S c r i p t s��  ��  ��   c o      ���� 0 _scriptpath   a  n o n r   Z o p q p b   Z k r s r b   Z e t u t n   Z a v w v 1   ] a��
�� 
strq w o   Z ]���� 0 _scriptpath   u m   a d x x � y y    s n   e j z { z 1   f j��
�� 
strq { o   e f���� 0 _dbpath   q o      ���� 0 _command   o  | } | X   p � ~��  ~ r   � � � � � b   � � � � � b   � � � � � o   � ����� 0 _command   � m   � � � � � � �    � n   � � � � � 1   � ���
�� 
strq � l  � � ����� � n   � � � � � 1   � ���
�� 
psxp � o   � ����� 0 _pwfile  ��  ��   � o      ���� 0 _command  �� 0 _pwfile    o   s t���� 0 _pwfiles   }  � � � l  � ���������  ��  ��   �  � � � l   � ��� � ���   � V P
		Run the command.
		The database password is piped into the script as stdin.
	    � � � � � 
 	 	 R u n   t h e   c o m m a n d . 
 	 	 T h e   d a t a b a s e   p a s s w o r d   i s   p i p e d   i n t o   t h e   s c r i p t   a s   s t d i n . 
 	 �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � 
 e c h o   � n   � � � � � 1   � ���
�� 
strq � o   � ����� 	0 _dbpw   � m   � � � � � � �    |   � o   � ����� 0 _command  ��   �  ��� � l  � ���������  ��  ��  ��   
  f        ��� � l     ��������  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ���� � ���
�� .aevtoappnull  �   � ****��  ��   � ���� 0 _pwfile   � (�� ���������� -�� 0�������� L N�� R�� V���������� i�� l������ x�������� � � ���
�� 
prmp
�� 
mlsl�� 
�� .sysostdfalis    ��� null�� 0 _pwfiles  
�� 
prmt
�� 
dfnm
�� .sysonwflfile    ��� null�� 0 _dbfile  
�� 
psxp�� 0 _dbpath  
�� 
dtxt
�� 
appr
�� 
htxt�� 
�� .sysodlogaskr        TEXT
�� 
ttxt�� 	0 _dbpw  
�� 
in D
�� .sysorpthalis        TEXT�� 0 _scriptpath  
�� 
strq�� 0 _command  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� .sysoexecTEXT���     TEXT�� �) �*���e� E�O*����� 
E�O��,E�O��%�%a a a a a ea  a ,E` Oa a a l �,E` O_ a ,a %�a ,%E`  O +�[a !a "l #kh  _  a $%��,a ,%E`  [OY��Oa %_ a ,%a &%_  %j 'OPUascr  ��ޭ