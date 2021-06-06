#include <led.h>
#include <timer.h>

int main(void) {
  int num_leds;
  int err = led_count(&num_leds);
  if (err < 0) return err;

  // Wait for some time before start
  delay_ms(15000);

  // Turn each LED on and off
  for (int i = 0; i < num_leds; i++) {
    led_on(i);
    delay_ms(10000);
    led_off(i);
    delay_ms(10000);
  }

  // Turn all LEDs on and off
  for (int i = 0; i < num_leds; i++) {
    led_on(i);
  }
  delay_ms(10000);
  for (int i = 0; i < num_leds; i++) {
    led_off(i);
  }
}
