package com.trimline.investor.data.model

import com.trimline.investor.member

/**
 * Data class that captures user information for logged in users retrieved from LoginRepository
 */
data class LoggedInUser(
    val member :member?=null


)