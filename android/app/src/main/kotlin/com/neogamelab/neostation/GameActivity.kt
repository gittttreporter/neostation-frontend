package com.neogamelab.neostation

import android.os.Bundle
import android.view.WindowManager
import androidx.appcompat.app.AppCompatActivity
import com.swordfish.libretrodroid.GLRetroView
import com.swordfish.libretrodroid.GLRetroViewData
import java.io.File

class GameActivity : AppCompatActivity() {

    private lateinit var retroView: GLRetroView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

        val coreName = intent.getStringExtra("core_path") ?: run {
            android.util.Log.e("GameActivity", "core_path is null!")
            return
        }
        val romPath = intent.getStringExtra("rom_path") ?: run {
            android.util.Log.e("GameActivity", "rom_path is null!")
            return
        }

        android.util.Log.d("GameActivity", "Core: $coreName")
        android.util.Log.d("GameActivity", "ROM: $romPath")

        val extractedCorePath = extractCoreIfNeeded(coreName)
        val resolvedRomPath = resolveRomPath(romPath)  // ← MUTAT AICI

        android.util.Log.d("GameActivity", "Extracted core: $extractedCorePath")
        android.util.Log.d("GameActivity", "Resolved ROM: $resolvedRomPath")

        val data = GLRetroViewData(this).apply {
            coreFilePath = extractedCorePath
            gameFilePath = resolvedRomPath  // ← corect
        }

        retroView = GLRetroView(this, data)
        lifecycle.addObserver(retroView)
        setContentView(retroView)
    }

    private fun extractCoreIfNeeded(coreName: String): String {
        val coreFile = File(filesDir, "cores/$coreName")

        if (!coreFile.exists()) {
            coreFile.parentFile?.mkdirs()
            assets.open("cores/$coreName").use { input ->
                coreFile.outputStream().use { output ->
                    input.copyTo(output)
                }
            }
        }

        return coreFile.absolutePath
    }

    private fun resolveRomPath(uriString: String): String {
        if (!uriString.startsWith("content://")) return uriString

        val uri = android.net.Uri.parse(uriString)
        val fileName = android.net.Uri.decode(uriString.substringAfterLast("%2F"))
        val romsDir = File(cacheDir, "roms")
        romsDir.mkdirs()

        val destFile = File(romsDir, fileName)

        if (!destFile.exists()) {
            val cachedRoms = romsDir.listFiles()?.sortedBy { it.lastModified() } ?: emptyList()
            if (cachedRoms.size >= 5) {
                cachedRoms.take(cachedRoms.size - 4).forEach { it.delete() }
            }

            contentResolver.openInputStream(uri)?.use { input ->
                destFile.outputStream().use { output ->
                    input.copyTo(output)
                }
            }
        } else {
            destFile.setLastModified(System.currentTimeMillis())
        }

        return destFile.absolutePath
    }

    override fun onResume() {
        super.onResume()
        if (::retroView.isInitialized) {
            retroView.onResume()
        }
    }

    override fun onPause() {
        super.onPause()
        if (::retroView.isInitialized) {
            retroView.onPause()
        }
    }
}
