package net.immersion.kwangsaeng

import android.content.ActivityNotFoundException
import android.content.Intent
import android.content.Intent.URI_INTENT_SCHEME
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
                    val intent = Intent.parseUri(url, URI_INTENT_SCHEME)
                    result.success(intent.dataString)
                } catch (e: URISyntaxException) {
                    result.notImplemented()
                } catch (e: ActivityNotFoundException) {
                    result.notImplemented()
                }
            }
        }

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "net.immersion.kwangsaeng")
        channel.setMethodCallHandler(handler)
    }
}
