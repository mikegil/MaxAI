#!/bin/zsh

# PAI Voice Server Menu Bar Indicator
# For BitBar/SwiftBar - updates every 5 seconds

# Check if server is running
if curl -s -f http://localhost:8888/health > /dev/null 2>&1; then
    # Server is running - show green indicator with size
    echo "🎙️ | size=18"
    echo "---"
    echo "PAI Voice Server: ✅ Running"
    
    # Check for ElevenLabs
    if [ -f ~/.env ] && grep -q "ELEVENLABS_API_KEY=" ~/.env 2>/dev/null; then
        API_KEY=$(grep "ELEVENLABS_API_KEY=" ~/.env | cut -d'=' -f2)
        if [ "$API_KEY" != "your_api_key_here" ] && [ -n "$API_KEY" ]; then
            echo "Voice: ElevenLabs AI"
        else
            echo "Voice: macOS Say"
        fi
    else
        echo "Voice: macOS Say"
    fi
    
    echo "Port: 8888"
    echo "---"
    echo "Stop Server | bash='~/Documents/MaxAI/.claude/voice-server/stop.sh' terminal=false refresh=true"
    echo "Restart Server | bash='~/Documents/MaxAI/.claude/voice-server/restart.sh' terminal=false refresh=true"
else
    # Server is not running - show gray indicator with size
    echo "🎙️⚫ | size=18"
    echo "---"
    echo "PAI Voice Server: ⚫ Stopped"
    echo "---"
    echo "Start Server | bash='~/Documents/MaxAI/.claude/voice-server/start.sh' terminal=false refresh=true"
fi

echo "---"
echo "Check Status | bash='~/Documents/MaxAI/.claude/voice-server/status.sh' terminal=true"
echo "View Logs | bash='~/Documents/MaxAI/.claude/voice-server/show_logs.sh' terminal=true"
echo "---"
echo "Test Voice | bash='~/Documents/MaxAI/.claude/voice-server/test_voice.sh' terminal=false"
echo "---"
echo "Open Voice Server Folder | bash='open ${PAI_DIR}/voice-server'"
echo "Uninstall | bash='${PAI_DIR}/voice-server/uninstall.sh' terminal=true"