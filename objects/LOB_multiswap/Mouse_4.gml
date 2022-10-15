/// @description Insert description here
if global.IAMHOST
{
enabled = !enabled
image_index = enabled
network_send(NN_LBY_MULTISWAP, [buffer_u8], [enabled])

}