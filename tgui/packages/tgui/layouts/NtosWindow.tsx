/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { BooleanLike } from 'common/react';
import { resolveAsset } from 'tgui/assets';
import { useBackend } from 'tgui/backend';
import { Box, Button, Stack, Tooltip } from 'tgui/components';

import { Window } from './Window';

export type NTOSData = {
  // authenticatedUser: string | null;
  // authIDName: string;
  // comp_light_color: string;
  // has_id: BooleanLike;
  has_gps: BooleanLike;
  gps_icon: string | null;
  gps_data: string | null;
  // id_name: string;
  // login: Login;
  // pai: string | null;
  PC_apclinkicon: string | null;
  PC_batteryicon: string | null;
  PC_batterypercent: string | null;
  PC_showbatteryicon: BooleanLike;
  PC_device_theme: string | null;
  PC_hasheader: BooleanLike;
  PC_lowpower_mode: BooleanLike;
  PC_light_name: string | null;
  PC_light_on: BooleanLike;
  PC_ntneticon: string | null;
  PC_programheaders: { icon: string }[];
  PC_showexitprogram: BooleanLike;
  PC_stationdate: string;
  PC_stationtime: string;
  // Programs
  hard_drive: Drive;
  portable_drive: Drive | null;
  // programs: Program[];
  // proposed_login: Login;
  // removable_media: string[];
  // show_imprint: BooleanLike;
};

export type Drive = {
  ref: string;
  name: string;
  autorun: string;
  programs: Program[];
};

export type Program = {
  desc: string;
  icon: string;
  name: string;
  running: BooleanLike;
};

export type Login = {
  IDInserted?: BooleanLike;
  IDJob: string | null;
  IDName: string | null;
};

export const NtosWindow = (props) => {
  const { title, width = 575, height = 700, children, theme } = props;
  const { act, data } = useBackend<NTOSData>();
  const {
    has_gps,
    gps_icon,
    gps_data,
    PC_device_theme,
    PC_batteryicon,
    PC_batterypercent,
    PC_apclinkicon,
    PC_ntneticon,
    PC_stationdate,
    PC_stationtime,
    PC_programheaders = [],
    PC_showexitprogram,
    PC_lowpower_mode,
    PC_light_name,
    PC_light_on,
  } = data;

  return (
    <Window
      title={title}
      width={width}
      height={height}
      // Allows people to specify themes for syndicate-only apps
      theme={theme || PC_device_theme || ''}
    >
      <div className="NtosWindow">
        <div
          className="NtosWindow__header NtosHeader"
          style={{ height: has_gps ? '4.5em' : '2em' }}
        >
          <Stack vertical ml={1} mr={1}>
            <Stack.Item>
              <Stack justify="space-between">
                <Stack.Item>
                  <div>
                    <Tooltip position="bottom" content={PC_stationdate}>
                      <Box
                        inline
                        bold
                        mr={2}
                        style={{ borderBottom: '2px dotted #fff' }}
                      >
                        {PC_stationtime}
                      </Box>
                    </Tooltip>
                    <Box inline italic mr={2} opacity={0.33}>
                      {(PC_device_theme === 'syndicate' && 'Syndix') || 'NtOS'}
                      {!!PC_lowpower_mode && ' - RUNNING ON LOW POWER MODE'}
                    </Box>
                  </div>
                </Stack.Item>
                <Stack.Item textAlign="right">
                  <div>
                    {PC_programheaders.map((header) => (
                      <Box key={header.icon} inline mr={1}>
                        <img
                          className="NtosHeader__icon"
                          src={resolveAsset(header.icon)}
                        />
                      </Box>
                    ))}
                    <Box inline>
                      {PC_ntneticon && (
                        <img
                          className="NtosHeader__icon"
                          src={resolveAsset(PC_ntneticon)}
                        />
                      )}
                    </Box>
                    <Box inline>
                      {PC_apclinkicon && (
                        <img
                          className="NtosHeader__icon"
                          src={resolveAsset(PC_apclinkicon)}
                        />
                      )}
                    </Box>
                    {!!PC_batteryicon && (
                      <Box inline mr={1}>
                        <img
                          className="NtosHeader__icon"
                          src={resolveAsset(PC_batteryicon)}
                        />
                        {PC_batterypercent}
                      </Box>
                    )}
                    {!!PC_light_name && (
                      <Button
                        color="transparent"
                        icon="lightbulb-o"
                        tooltip={`Turn Light ${PC_light_on ? 'Off' : 'On'}`}
                        tooltipPosition="bottom"
                        selected={PC_light_on}
                        onClick={() =>
                          act('PC_toggle_component', {
                            component: PC_light_name,
                          })
                        }
                      />
                    )}
                    {!!PC_showexitprogram && (
                      <Button
                        color="transparent"
                        icon="window-minimize-o"
                        tooltip="Minimize"
                        tooltipPosition="bottom"
                        onClick={() => act('PC_minimize')}
                      />
                    )}
                    {!!PC_showexitprogram && (
                      <Button
                        color="transparent"
                        icon="window-close-o"
                        tooltip="Close"
                        tooltipPosition="bottom-start"
                        onClick={() => act('PC_exit')}
                      />
                    )}
                    {!PC_showexitprogram && (
                      <Button
                        textAlign="center"
                        color="transparent"
                        icon="power-off"
                        tooltip="Power off"
                        tooltipPosition="bottom-start"
                        onClick={() => act('PC_shutdown')}
                      />
                    )}
                  </div>
                </Stack.Item>
              </Stack>
            </Stack.Item>
            {!!has_gps && (
              <Stack.Item mt={-0.6}>
                <Stack justify="center" align="center">
                  <Stack.Item>
                    <Box inline mr={1}>
                      <img
                        className="NtosHeader__icon"
                        src={resolveAsset(gps_icon || '')}
                      />
                    </Box>
                    <Box inline>{gps_data}</Box>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
            )}
          </Stack>
        </div>
        {children}
      </div>
    </Window>
  );
};

const NtosWindowContent = (props) => {
  const { data } = useBackend<NTOSData>();
  const { has_gps } = data;

  return (
    <div className="NtosWindow__content">
      <Window.Content
        style={{ marginTop: has_gps ? '4.5em' : '2em' }}
        {...props}
      />
    </div>
  );
};

NtosWindow.Content = NtosWindowContent;
