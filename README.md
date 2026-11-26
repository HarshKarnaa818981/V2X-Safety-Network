# V2X Dashboard — classified Wildlife Shield

This revision preserves the traffic dashboard, road and original Wildlife application while adding classified triple-press alerts, physical long-press clearing, a separate enhanced Wildlife presentation and verified LoRa restoration logic.

**Start here:** [Final operating and flashing guide](docs/FINAL_UPGRADE_GUIDE.md).

## Launch

Extract the complete ZIP. With Node.js 22.12 or newer installed, double-click **RUN_DASHBOARD.bat**. Open **http://localhost:4173** in Chrome or Edge; keep the terminal open. Ctrl+C stops the server. The production build is included, so normal use does not require repeated npm installation.

For source development/rebuilding:

```powershell
npm.cmd ci
npm.cmd run build
npm.cmd test
npm.cmd start
```

Use the production server for the complete FSU and notification integration. `npm run dev` is for frontend development only.

## Button operation

Connect a normally-open switch between **FSU GPIO32 and GND** using contacts from different internally connected pairs. See [wiring diagram](docs/GPIO32_Button_Wiring.png).

- Three separate short presses within 2.5 seconds activate only a fresh confirmed BIG CAT or ELEPHANT result.
- One or two presses do not activate. Noise/quiet/stale or unconfirmed inputs are rejected.
- The category remains latched. Hold for at least two seconds after the animal has passed to clear.
- Animal confirmation beep: two seconds. Clear: three short beeps.

The FSU classifier receives simulated Wildlife Lab signals. These are not physical species measurements.

## Connect and flash

Flash the **four matching working sketches** using the guide. Traffic protocol is **V2X-DASH-4**, 68-byte packet V5; old versions are deliberately rejected. The FSU LoRa module is disabled.

Laptop Wi-Fi: **V2X-Forest**, password **V2XForest2026**, FSU **192.168.4.1**. Use phone USB tethering for internet. Connect RPU USB in Hardware mode. Connect both the FSU Wi-Fi Lab and the Shield monitor. The relay needs the laptop page, FSU Wi-Fi and RPU USB to remain available.

Forest notification is **NOTIFICATION NOT CONFIGURED** until an approved provider is configured. No delivery is claimed without its receipt.

## Contents and evidence

- `firmware/working`: current four board sketches and the tested button-state header.
- `firmware/baseline`: preserved earlier firmware.
- `archives/V2X_Dashboard_Upgraded_original.zip`: exact starting project archive, unchanged.
- `public/wildlife-original`: untouched friend-provided application/media.
- `public/wildlife-wifi`: preserved Wi-Fi adaptation.
- `public/wildlife-enhanced`: separate presentation using identical adaptation JavaScript.
- `docs/FINAL_UPGRADE_GUIDE.md`: wiring, behavior, protocol migration, flashing, provider contract and physical acceptance checks.
- `docs/VALIDATION_FINAL.md`: current validation results and limitations.

Older reports in docs describe historical versions; use the FINAL guide/report for this revision. All road positions remain firmware-generated virtual progress. Hardware tests, browser visual/audio checks and approved-provider delivery still require the physical setup.
