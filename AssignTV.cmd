@ECHO OFF
IF EXIST "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" assignment --id 0001CoABChDotsvQvDAR7p9VBnBdqw7tEigIACAAAgAJAHoWTHXkHrEiUZcvSgGV_4RlyNRxJ6gIzfapiFJ0QZoRGkBaKE8T52wfWCOo6v7lm8e6ASEAvQIe1tMy0-E6il0PcIYXuDh6HDtVdmbP98eDGtwlmBJYk9nAVf8KoaosDsyQIAEQ_pqP0wY=
	Echo TV Present : %errorlevel%
	) ELSE (
	Echo No TV Present
)
