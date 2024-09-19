package com.example.pdf_example

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val apiKey: String = getString(R.string.api_key)
        val mdlClientId: String = getString(R.string.mdl_client_id)
        Toast.makeText(context,  "Api Key : " +apiKey,Toast.LENGTH_LONG).show()
        Toast.makeText(context,  "Mdl Client Id : " +mdlClientId,Toast.LENGTH_LONG).show()
    }
}
