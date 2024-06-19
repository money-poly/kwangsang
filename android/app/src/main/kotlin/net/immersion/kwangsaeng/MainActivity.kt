package net.immersion.kwangsaeng

import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.KeyData.CHANNEL
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.net.URISyntaxException

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        
        val handler = MethodChannel.MethodCallHandler { call, result ->
            if (call.method == "getAppUrl") {
                try {
                    val url: String = call.argument("url")!!
                    startSchemeIntent(url)
                } catch (e: URISyntaxException) {
                    result.notImplemented()
                } catch (e: ActivityNotFoundException) {
                    result.notImplemented()
                }
            }
        }

        val channel = MethodChannel(flutterEngine.dartExecutor, CHANNEL)
        channel.setMethodCallHandler(handler)
    }

    private fun startSchemeIntent(url: String): Boolean {
        val schemeIntent: Intent = try {
            Intent.parseUri(url, Intent.URI_INTENT_SCHEME) // Intent 스킴을 파싱
        } catch (e: URISyntaxException) {
            return false
        }
        try {
            startActivity(schemeIntent) // 앱으로 이동
            return true
        } catch (e: ActivityNotFoundException) { // 앱이 설치 안 되어 있는 경우
            val packageName = schemeIntent.getPackage()

            if (!packageName.isNullOrBlank()) {
                startActivity(
                    Intent(
                        Intent.ACTION_VIEW,
                        Uri.parse("market://details?id=$packageName") // 스토어로 이동
                    )
                )
                return true
            }
        }
        return false
    }
}
