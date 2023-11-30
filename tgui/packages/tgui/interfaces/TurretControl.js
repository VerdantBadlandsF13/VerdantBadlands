import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Button, LabeledList, NoticeBox, Section } from '../components';
import { Window } from '../layouts';

export const PortableTurret = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    locked,
    on,
    turret_shoot_wildlife,
    turret_shoot_players,
    turret_shoot_raiders,
    turret_shoot_robots,
    turret_shoot_ignore_faction,
    turret_make_noise,
    turret_use_laser_pointer,
  } = data;
  return (
    <Window
      width={310}
      height={lasertag_turret ? 110 : 292}>
      <Window.Content>
        <NoticeBox>
          Swipe an ID card to {locked ? 'unlock' : 'lock'} this interface.
        </NoticeBox>
        <Fragment>
          <Section>
            <LabeledList>
              <LabeledList.Item
                label="Status"
                buttons={!lasertag_turret && (!!allow_manual_control
                  || (!!manual_control && !!silicon_user)) && (
                  <Button
                    icon={manual_control ? "wifi" : "terminal"}
                    content={manual_control
                      ? "Remotely Controlled"
                      : "Manual Control"}
                    disabled={manual_control}
                    color="bad"
                    onClick={() => act('manual')} />
                )}>
                <Button
                  icon={on ? 'power-off' : 'times'}
                  content={on ? 'On' : 'Off'}
                  selected={on}
                  disabled={locked}
                  onClick={() => act('power')} />
              </LabeledList.Item>
            </LabeledList>
          </Section>
          {!lasertag_turret && (
            <Section
              title="Target Settings"
              buttons={(
                <Button.Checkbox
                  checked={!turret_shoot_ignore_faction}
                  content="Disable IFF"
                  disabled={locked}
                  onClick={() => act('turret_return_ignore_faction')} />
              )}>
              <Button.Checkbox
                fluid
                checked={turret_shoot_players}
                content="Target Civilians"
                disabled={locked}
                onClick={() => act('turret_return_shoot_players')} />
              <Button.Checkbox
                fluid
                checked={turret_shoot_wildlife}
                content="Target All Wildlife"
                disabled={locked}
                onClick={() => act('turret_return_shoot_wildlife')} />
              <Button.Checkbox
                fluid
                checked={turret_shoot_raiders}
                content="Target Hostile Wildlife"
                disabled={locked}
                onClick={() => act('turret_return_shoot_raiders')} />
              <Button.Checkbox
                fluid
                checked={turret_shoot_robots}
                content="Target Machinery"
                disabled={locked}
                onClick={() => act('turret_return_shoot_robots')} />
              <Button.Checkbox
                fluid
                checked={turret_use_laser_pointer}
                content="Targetting Laser"
                disabled={locked}
                onClick={() => act('turret_return_use_laser_pointer')} />
              <Button.Checkbox
                fluid
                checked={turret_make_noise}
                content="Internal Speakers"
                disabled={locked}
                onClick={() => act('turret_return_make_noise')} />
            </Section>
          )}
        </Fragment>
      </Window.Content>
    </Window>
  );
};
