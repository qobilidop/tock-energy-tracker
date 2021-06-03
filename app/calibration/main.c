#include <led.h>
#include <timer.h>

int main(void) {
  int num_leds;
  int err = led_count(&num_leds);
  if (err < 0) return err;

  // Wait for 10s before start
  delay_ms(10000);

  for (int i = 0; i < num_leds; i++) {
    // Turn the ith LED on for 5s
    led_on(i);
    delay_ms(5000);
    // Turn the ith LED off for 5s
    led_off(i);
    delay_ms(5000);
  }
}
