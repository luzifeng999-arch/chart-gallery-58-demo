$baseDir = "C:\Users\admin\Desktop\skill\output\chart-gallery-58"
$files = Get-ChildItem -Path $baseDir -Recurse -Filter "*.html" | Where-Object { 
    $_.Name -ne "gallery.html" -and $_.Name -ne "index.html" 
}

$listener = @"

window.addEventListener('message', function(e) {
  if (e.data && e.data.type === 'setTheme') {
    if (typeof applyTheme === 'function') {
      mode = e.data.theme;
      applyTheme(mode);
    }
    var btn = document.getElementById('theme-btn');
    if (btn) btn.style.display = 'none';
  }
});
"@

$count = 0
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    if ($content -notmatch "addEventListener\('message'") {
        # Insert listener before last </script>
        $lastScript = $content.LastIndexOf("</script>")
        if ($lastScript -ge 0) {
            $content = $content.Substring(0, $lastScript) + $listener + "</script>" + $content.Substring($lastScript + 9)
            [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
            $count++
            Write-Host "Updated: $($file.Name)"
        }
    } else {
        Write-Host "Skipped (already has listener): $($file.Name)"
    }
}
Write-Host ""
Write-Host "Done! Processed $count files."
