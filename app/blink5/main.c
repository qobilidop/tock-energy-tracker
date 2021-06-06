#include <led.h>
#include <timer.h>

int main(void) {
  int i_led = 0;
  int j_led = 2;

  // Wait for some time before start
  delay_ms(10000);

  // Turn the LEDs on and off
  for (int count = 0; count < 3; count++) {
    led_on(i_led);
    led_on(j_led);
    delay_ms(5000);
    led_off(i_led);
    led_off(j_led);
    delay_ms(5000);
  }
}
