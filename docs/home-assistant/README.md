# Home Assistant configuration for the custom DragonBreath firmware

The firmware publishes the native MQTT climate entity and chamber/element sensors. This installation keeps Home Assistant's global temperature unit in Fahrenheit for the rest of the house, while presenting DragonBreath's target control in Celsius through a template number helper.

Files:

- `template-number.yaml` — creates `number.dragonbreath_target_celsius` and converts between the HA climate entity's displayed Fahrenheit value and Celsius.
- `dragonbreath-card.yaml` — the working Lovelace card: banner, AUTO/HEAT/OFF buttons, an active Celsius slider in AUTO/HEAT, and a locked gray `0 °C` slider while OFF.

Required custom cards used by this dashboard example:

- Banner Card (`custom:banner-card`)
- Slider Button Card (`custom:slider-button-card`)
- Button Card (`custom:button-card`)

The firmware itself does not depend on these Lovelace cards.

## Screenshots

### Native climate dashboard card

| AUTO | HEAT | OFF |
|:---:|:---:|:---:|
| <img src="../screenshots/r9/home-assistant-auto.png" width="250" alt="DragonBreath Home Assistant card in AUTO mode"> | <img src="../screenshots/r9/home-assistant-heat.png" width="250" alt="DragonBreath Home Assistant card in HEAT mode"> | <img src="../screenshots/r9/home-assistant-off.png" width="250" alt="DragonBreath Home Assistant card in OFF mode"> |

AUTO and HEAT expose the active Celsius target slider. OFF intentionally renders a
locked gray `0 °C` control so changing a displayed target cannot accidentally imply
that the heater is active.

### MQTT sidecar options

<img src="../screenshots/r9/home-assistant-mqtt.png" width="700" alt="Home Assistant MQTT telemetry and control options">

The screenshot uses an RFC 5737 documentation-only broker address and a generic MQTT
username. No live broker address or account name is stored in the repository image.
