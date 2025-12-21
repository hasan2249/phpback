<?php

function has_permission($key) {
    $ci =& get_instance();
    $user_perms = $ci->session->userdata('permissions');
    
    if (is_array($user_perms) && in_array($key, $user_perms)) {
        return TRUE;
    }
    return FALSE;
}