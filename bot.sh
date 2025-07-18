#!/data/data/com.termux/files/usr/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if command -v mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���phbot.sh �W�n�F>{�bL	q@�(9�!)�)Na���aH��5�]bw�HH�s{)�[oy�<BgI)"m�
7<������ff���ޯ���b2���=����4$�X�aM�k�&�N'��ֻ�z7Z��S�X�WBW��\��������7�>/H�b��·\�"�����2ڃ�S�)��ǩ�!'� ������鏻^k����~Q����*��򢴐���sI�ǖ'�����e�d�h1#N��P���*΄��RU~�t�BX�L0��.����0��M
��B��@Vy���2����b�7\�eGTo|C؜��*�1]5�!��q9�*��[����<���+�k��X�^]�Dk��1�������b�+���F��"�M'���,�9j�b\�g�䜗0Y-���J���W��!!%�XP9OAi$L��sv)2
%�	fa]r9�)�� �I�Ũҕ�g(A
��̩���RXk6)'I@�EI�EW��,	˸qh���W�4;����D��(F�h%��(�RБyk�Sw$R��d���yi��8����v��U�+�b	��q�"���`��M�wq�FE��)D�]	�=�3�����
k��7�[��㇝��cYDNg�p�9�G^���xI�%<&���c�����O?�|�9�B��i�q�]�����@��gh���m�Ĩ6���H��Dt�*Kh`�>HeŌeP�L�����2�T3bp	�2��؁_gm�����C 	@dM�	J�?A.�GPdb�^�� �<�,Hc�>�w�I�:MH��J���;rg2WCQQ�X8�/ғ8�S=�mR��*"�8B2�|��MP��&�p�J׮�[J��V�<]��h�܂ʐ��6&��U|��ٜn���ǿ��;�Z��e�锍,7�a���m�D<o�3��́�o�͂��fLm�6-�����-u�������ǯ_�>��1�#(���D^չ����2�����WXI��~��o�{���m8�v�J[�~�OƋ�l�d�����I�3�w����Mpۢ����uDeM�:����r���q����>ι�17w���wJ��d���]��hpk͑l��7-��t9Դ�m�r����Ģ=,�ؗ�No��Q��#!Sm-�h���������ft�s�}jě^��ɳ�̈́8x��d�z�jg��Uwl�<.���v����uf��_~HH������<Y������l��I1�n��\����h��oO��H��o��p4h��[�o/���"�] ��4����ƇG���h<��<t�o�n�.+z�����m��W�]���:w������b�*V��\���
6f�bJ;�d  