FasdUAS 1.101.10   ��   ��    k             l    � ����  O     �  	  k    � 
 
     l   ��������  ��  ��        l    ��  ��    V P
		Input: Password item files
		(.txt files presumably exported from Yojimbo.)
	     �   � 
 	 	 I n p u t :   P a s s w o r d   i t e m   f i l e s 
 	 	 ( . t x t   f i l e s   p r e s u m a b l y   e x p o r t e d   f r o m   Y o j i m b o . ) 
 	      r        l    ����  I   ���� 
�� .sysostdfalis    ��� null��    ��  
�� 
prmp  m       �   > S e l e c t   e x p o r t e d   p a s s w o r d   f i l e s :  �� ��
�� 
mlsl  m    	��
�� boovtrue��  ��  ��    o      ���� 0 _pwfiles        l   ��������  ��  ��         l    �� ! "��   !60
		Input: Password database
		Name the database to which the passwords should be added.
		(Specifying an existing filename will prompt a replace file warning;
		technically true, although the existing database will be loaded first,
		and the new file will include original contents as well as the new.)
	    " � # #` 
 	 	 I n p u t :   P a s s w o r d   d a t a b a s e 
 	 	 N a m e   t h e   d a t a b a s e   t o   w h i c h   t h e   p a s s w o r d s   s h o u l d   b e   a d d e d . 
 	 	 ( S p e c i f y i n g   a n   e x i s t i n g   f i l e n a m e   w i l l   p r o m p t   a   r e p l a c e   f i l e   w a r n i n g ; 
 	 	 t e c h n i c a l l y   t r u e ,   a l t h o u g h   t h e   e x i s t i n g   d a t a b a s e   w i l l   b e   l o a d e d   f i r s t , 
 	 	 a n d   t h e   n e w   f i l e   w i l l   i n c l u d e   o r i g i n a l   c o n t e n t s   a s   w e l l   a s   t h e   n e w . ) 
 	    $ % $ r     & ' & l    (���� ( I   ���� )
�� .sysonwflfile    ��� null��   ) �� * +
�� 
prmt * m     , , � - - $ P a s s w o r d   d a t a b a s e : + �� .��
�� 
dfnm . m     / / � 0 0   p a s s w o r d s . p s a f e 3��  ��  ��   ' o      ���� 0 _dbfile   %  1 2 1 r    ! 3 4 3 n     5 6 5 1    ��
�� 
psxp 6 o    ���� 0 _dbfile   4 o      ���� 0 _dbpath   2  7 8 7 l  " "��������  ��  ��   8  9 : 9 l   " "�� ; <��   ; * $
		Input: Database master password
	    < � = = H 
 	 	 I n p u t :   D a t a b a s e   m a s t e r   p a s s w o r d 
 	 :  > ? > r   " E @ A @ n   " A B C B 1   = A��
�� 
ttxt C l  " = D���� D I  " =�� E F
�� .sysodlogaskr        TEXT E b   " ' G H G b   " % I J I m   " # K K � L L  P a s s w o r d   f o r   J o   # $���� 0 _dbpath   H m   % & M M � N N  : F �� O P
�� 
dtxt O m   * - Q Q � R R   P �� S T
�� 
appr S m   0 3 U U � V V 0 D a t a b a s e   M a s t e r   P a s s w o r d T �� W��
�� 
htxt W m   6 7��
�� boovtrue��  ��  ��   A o      ���� 	0 _dbpw   ?  X Y X l  F F��������  ��  ��   Y  Z [ Z l   F F�� \ ]��   \ � �
		Assemble the command.
		First, find the contained Tcl script that does the actual work.
		As its first argument, append the path to the password database file.
		Lastly, append the path to each selected password file.
	    ] � ^ ^� 
 	 	 A s s e m b l e   t h e   c o m m a n d . 
 	 	 F i r s t ,   f i n d   t h e   c o n t a i n e d   T c l   s c r i p t   t h a t   d o e s   t h e   a c t u a l   w o r k . 
 	 	 A s   i t s   f i r s t   a r g u m e n t ,   a p p e n d   t h e   p a t h   t o   t h e   p a s s w o r d   d a t a b a s e   f i l e . 
 	 	 L a s t l y ,   a p p e n d   t h e   p a t h   t o   e a c h   s e l e c t e d   p a s s w o r d   f i l e . 
 	 [  _ ` _ r   F Y a b a n   F U c d c 1   S U��
�� 
psxp d l  F S e���� e I  F S�� f g
�� .sysorpthalis        TEXT f m   F I h h � i i  y j 2 p w s a f e . t c l g �� j��
�� 
in D j m   L O k k � l l  S c r i p t s��  ��  ��   b o      ���� 0 _scriptpath   `  m n m r   Z o o p o b   Z k q r q b   Z e s t s n   Z a u v u 1   ] a��
�� 
strq v o   Z ]���� 0 _scriptpath   t m   a d w w � x x    r n   e j y z y 1   f j��
�� 
strq z o   e f���� 0 _dbpath   p o      ���� 0 _command   n  { | { X   p � }�� ~ } r   � �  �  b   � � � � � b   � � � � � o   � ����� 0 _command   � m   � � � � � � �    � n   � � � � � 1   � ���
�� 
strq � l  � � ����� � n   � � � � � 1   � ���
�� 
psxp � o   � ����� 0 _pwfile  ��  ��   � o      ���� 0 _command  �� 0 _pwfile   ~ o   s t���� 0 _pwfiles   |  � � � l  � ���������  ��  ��   �  � � � l   � ��� � ���   � V P
		Run the command.
		The database password is piped into the script as stdin.
	    � � � � � 
 	 	 R u n   t h e   c o m m a n d . 
 	 	 T h e   d a t a b a s e   p a s s w o r d   i s   p i p e d   i n t o   t h e   s c r i p t   a s   s t d i n . 
 	 �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � 
 e c h o   � n   � � � � � 1   � ���
�� 
strq � o   � ����� 	0 _dbpw   � m   � � � � � � �    |   � o   � ����� 0 _command  ��   �  ��� � l  � ���������  ��  ��  ��   	  f     ��  ��     ��� � l     ��������  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �  ����  ��  ��   � ���� 0 _pwfile   � (�� ���������� ,�� /�������� K M�� Q�� U���������� h�� k������ w�������� � � ���
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