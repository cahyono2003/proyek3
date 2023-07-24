package com.example.loginproject

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.InputType
import android.widget.EditText
import android.widget.ImageButton
import android.widget.ImageView


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val imageButton: ImageButton = findViewById(R.id.imageButton1)
        val editText: EditText = findViewById(R.id.editText2)
        var isPasswordVisible = false // Variabel untuk melacak apakah password sedang terlihat atau disembunyikan

        imageButton.setOnClickListener {
            if (isPasswordVisible) {
                // Jika password sedang terlihat, set inputType EditText menjadi "textPassword" untuk menyembunyikannya
                editText.inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD
                isPasswordVisible = false
            } else {
                // Jika password disembunyikan, set inputType EditText menjadi "textVisiblePassword" untuk memunculkannya
                editText.inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                isPasswordVisible = true
            }
            // Setel kursor ke akhir teks pada EditText
            editText.setSelection(editText.text.length)
        }
    }
}