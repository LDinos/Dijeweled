obj_tfj_client.sendRequest("RDY")
obj_tfj_inlobby_renderer.i_am_ready=!obj_tfj_inlobby_renderer.i_am_ready
text = obj_tfj_inlobby_renderer.i_am_ready ? "UNREADY" : "READY"

