@echo off
echo ========================================
echo 推送代码到 GitHub
echo ========================================
echo.
echo 请先在浏览器中创建 GitHub 仓库: chart-gallery-58
echo 然后执行以下命令:
echo.
cd C:\Users\admin\Desktop\skill\output\chart-gallery-58
git branch -M main
git remote add origin https://github.com/luzifeng/chart-gallery-58.git
git push -u origin main
echo.
echo ========================================
echo 推送完成！
echo ========================================
pause
