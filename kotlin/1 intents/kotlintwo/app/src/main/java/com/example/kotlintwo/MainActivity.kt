package com.example.kotlintwo

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val greetingTextView = findViewById<TextView>(R.id.tvHelo);
        val inputField = findViewById<EditText>(R.id.tvName);
        val submitButton = findViewById<Button>(R.id.btnSubmit);
        val offersButton = findViewById<Button>(R.id.btnOffers);
        var  enteredName = "";

        submitButton.setOnClickListener {
            enteredName = inputField.text.toString();

            if (enteredName == "") {
                offersButton.visibility = View.INVISIBLE;
                greetingTextView.text = "";
                Toast.makeText(this@MainActivity, "Please type your name", Toast.LENGTH_LONG)
                    .show();
            } else {
                val message = "Welcome $enteredName"
                greetingTextView.text = message;
                inputField.text.clear();
                offersButton.visibility = View.VISIBLE;
            }
        }

        offersButton.setOnClickListener {
            val intent = Intent(this, MainActivity2::class.java);
            intent.putExtra(
                "USER",  enteredName
            )
            startActivity(intent);
        }
    }
}