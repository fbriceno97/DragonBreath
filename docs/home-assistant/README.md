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
