pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

import qs.modules.common

Singleton {
    id: root

    property var data: ({
        quote: "",
        author: "",
        lastRefresh: 0,
    })

    function getData() {
        fetcher.command[2] = "curl -s https://stoic.tekloon.net/stoic-quote";
        fetcher.running = true;
    }

    Component.onCompleted: {
        root.getData();
    }

    Process {
        id: fetcher
        command: ["bash", "-c", ""]
        stdout: StdioCollector {
            onStreamFinished: {
                if (text.length === 0)
                    return;
                try {
                    const parsedData = JSON.parse(text);
                    root.data.quote = parsedData?.data?.quote || "";
                    root.data.author = parsedData?.data?.author || "";
                    root.data.lastRefresh = Date.now();
                    console.info(`[StoicQuote] ${root.data.quote} — ${root.data.author}`);
                } catch (e) {
                    console.error(`[StoicQuote] ${e.message}`);
                }
            }
        }
    }
}
